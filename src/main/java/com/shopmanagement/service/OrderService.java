package com.shopmanagement.service;

import com.shopmanagement.dto.OrderDto;
import com.shopmanagement.dto.OrderItemDto;
import com.shopmanagement.entity.*;
import com.shopmanagement.repository.OrderRepository;
import com.shopmanagement.repository.ProductRepository;
import com.shopmanagement.repository.UserRepository;
import com.shopmanagement.service.InventoryService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class OrderService {
    
    private final OrderRepository orderRepository;
    private final UserRepository userRepository;
    private final ProductRepository productRepository;
    private final InventoryService inventoryService;
    
    public OrderService(OrderRepository orderRepository, UserRepository userRepository, ProductRepository productRepository, InventoryService inventoryService) {
        this.orderRepository = orderRepository;
        this.userRepository = userRepository;
        this.productRepository = productRepository;
        this.inventoryService = inventoryService;
    }
    
    public List<OrderDto> getAllOrders() {
        return orderRepository.findAll().stream()
                .map(this::convertToDto)
                .collect(Collectors.toList());
    }
    
    public OrderDto getOrderById(Long id, Authentication authentication) {
        Order order = orderRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Order not found"));
        
        // Check if user can access this order
        User currentUser = (User) authentication.getPrincipal();
        if (!currentUser.getRole().equals(Role.ADMIN) && 
            !currentUser.getRole().equals(Role.STAFF) && 
            !order.getUser().getId().equals(currentUser.getId())) {
            throw new RuntimeException("Access denied");
        }
        
        return convertToDto(order);
    }
    
    public List<OrderDto> getOrdersByUser(Authentication authentication) {
        User currentUser = (User) authentication.getPrincipal();
        return orderRepository.findByUserId(currentUser.getId()).stream()
                .map(this::convertToDto)
                .collect(Collectors.toList());
    }
    
    public List<OrderDto> getOrdersByStatus(String status) {
        OrderStatus orderStatus = OrderStatus.valueOf(status.toUpperCase());
        return orderRepository.findByStatus(orderStatus).stream()
                .map(this::convertToDto)
                .collect(Collectors.toList());
    }
    
    @Transactional
    public OrderDto createOrder(OrderDto orderDto, Authentication authentication) {
        User currentUser = (User) authentication.getPrincipal();
        
        // Validate order items and check stock
        validateOrderItems(orderDto.getOrderItems());
        
        // Calculate total amount
        BigDecimal totalAmount = calculateTotalAmount(orderDto.getOrderItems());
        
        // Create order
        Order order = new Order();
        order.setUser(currentUser);
        order.setStatus(OrderStatus.PENDING);
        order.setTotalAmount(totalAmount);
        
        Order savedOrder = orderRepository.save(order);
        
        // Create order items and update stock
        createOrderItems(savedOrder, orderDto.getOrderItems());
        
        return convertToDto(savedOrder);
    }
    
    public OrderDto updateOrderStatus(Long id, String status) {
        Order order = orderRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Order not found"));
        
        try {
            OrderStatus orderStatus = OrderStatus.valueOf(status.toUpperCase());
            order.setStatus(orderStatus);
            Order savedOrder = orderRepository.save(order);
            return convertToDto(savedOrder);
        } catch (IllegalArgumentException e) {
            throw new RuntimeException("Invalid order status: " + status);
        }
    }
    
    @Transactional
    public OrderDto updateOrder(Long id, OrderDto orderDto) {
        Order order = orderRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Order not found"));
        
        // Validate order items and check stock
        validateOrderItems(orderDto.getOrderItems());
        
        // Calculate total amount
        BigDecimal totalAmount = calculateTotalAmount(orderDto.getOrderItems());
        
        // Update order
        order.setTotalAmount(totalAmount);
        
        // Clear existing order items and create new ones
        order.getOrderItems().clear();
        createOrderItems(order, orderDto.getOrderItems());
        
        Order savedOrder = orderRepository.save(order);
        return convertToDto(savedOrder);
    }
    
    public void deleteOrder(Long id) {
        Order order = orderRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Order not found"));
        
        // Restore stock if order is cancelled
        if (order.getStatus() != OrderStatus.CANCELLED) {
            restoreStock(order);
        }
        
        orderRepository.deleteById(id);
    }
    
    private void validateOrderItems(List<OrderItemDto> orderItems) {
        if (orderItems == null || orderItems.isEmpty()) {
            throw new RuntimeException("Order must contain at least one item");
        }
        
        for (OrderItemDto item : orderItems) {
            Product product = productRepository.findById(item.getProductId())
                    .orElseThrow(() -> new RuntimeException("Product not found: " + item.getProductId()));
            
            if (product.getStock() < item.getQuantity()) {
                throw new RuntimeException("Insufficient stock for product: " + product.getName() + 
                        ". Available: " + product.getStock() + ", Requested: " + item.getQuantity());
            }
            
            if (item.getQuantity() <= 0) {
                throw new RuntimeException("Quantity must be greater than 0 for product: " + product.getName());
            }
        }
    }
    
    private BigDecimal calculateTotalAmount(List<OrderItemDto> orderItems) {
        return orderItems.stream()
                .map(item -> item.getPrice().multiply(BigDecimal.valueOf(item.getQuantity())))
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }
    
    private void createOrderItems(Order order, List<OrderItemDto> orderItems) {
        for (OrderItemDto itemDto : orderItems) {
            Product product = productRepository.findById(itemDto.getProductId())
                    .orElseThrow(() -> new RuntimeException("Product not found"));
            
            // Create order item
            OrderItem orderItem = new OrderItem();
            orderItem.setOrder(order);
            orderItem.setProduct(product);
            orderItem.setQuantity(itemDto.getQuantity());
            orderItem.setPrice(itemDto.getPrice());
            
            // Update product stock
            product.setStock(product.getStock() - itemDto.getQuantity());
            productRepository.save(product);
            
            // Update inventory stock
            try {
                inventoryService.decreaseStock(product.getId(), itemDto.getQuantity());
            } catch (Exception e) {
                // If inventory doesn't exist, create it
                // This handles the case where inventory might not be initialized
            }
        }
    }
    
    private void restoreStock(Order order) {
        for (OrderItem orderItem : order.getOrderItems()) {
            Product product = orderItem.getProduct();
            product.setStock(product.getStock() + orderItem.getQuantity());
            productRepository.save(product);
            
            // Update inventory stock
            try {
                inventoryService.updateStockByProduct(product.getId(), product.getStock());
            } catch (Exception e) {
                // Handle case where inventory doesn't exist
            }
        }
    }
    
    public OrderDto convertToDto(Order order) {
        OrderDto dto = new OrderDto();
        dto.setId(order.getId());
        dto.setUserId(order.getUser().getId());
        dto.setStatus(order.getStatus());
        dto.setTotalAmount(order.getTotalAmount());
        dto.setCreatedAt(order.getCreatedAt());
        
        if (order.getOrderItems() != null) {
            List<OrderItemDto> itemDtos = order.getOrderItems().stream()
                    .map(this::convertOrderItemToDto)
                    .collect(Collectors.toList());
            dto.setOrderItems(itemDtos);
        }
        
        return dto;
    }
    
    private OrderItemDto convertOrderItemToDto(OrderItem orderItem) {
        OrderItemDto dto = new OrderItemDto();
        dto.setId(orderItem.getId());
        dto.setProductId(orderItem.getProduct().getId());
        dto.setQuantity(orderItem.getQuantity());
        dto.setPrice(orderItem.getPrice());
        dto.setProductName(orderItem.getProduct().getName());
        return dto;
    }
}
