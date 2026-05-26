package com.shopmanagement.service;

import com.shopmanagement.dto.InventoryDto;
import com.shopmanagement.entity.Inventory;
import com.shopmanagement.entity.Product;
import com.shopmanagement.repository.InventoryRepository;
import com.shopmanagement.repository.ProductRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class InventoryService {
    
    private final InventoryRepository inventoryRepository;
    private final ProductRepository productRepository;
    
    public InventoryService(InventoryRepository inventoryRepository, ProductRepository productRepository) {
        this.inventoryRepository = inventoryRepository;
        this.productRepository = productRepository;
    }
    
    public List<Inventory> getAllInventory() {
        return inventoryRepository.findAll();
    }
    
    public Inventory getInventoryById(Long id) {
        return inventoryRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Inventory not found"));
    }
    
    public Inventory getInventoryByProductId(Long productId) {
        return inventoryRepository.findByProductId(productId)
                .orElseThrow(() -> new RuntimeException("Inventory not found for product"));
    }
    
    public List<Inventory> getLowStockItems(Integer threshold) {
        return inventoryRepository.findByStockLessThanEqual(threshold);
    }
    
    public Inventory createInventory(Inventory inventory) {
        // Verify product exists
        Product product = productRepository.findById(inventory.getProduct().getId())
                .orElseThrow(() -> new RuntimeException("Product not found"));
        inventory.setProduct(product);
        
        return inventoryRepository.save(inventory);
    }
    
    public Inventory updateInventory(Long id, Inventory inventory) {
        Inventory existingInventory = getInventoryById(id);
        existingInventory.setStock(inventory.getStock());
        return inventoryRepository.save(existingInventory);
    }
    
    public Inventory updateStock(Long id, Integer stock) {
        Inventory inventory = getInventoryById(id);
        inventory.setStock(stock);
        return inventoryRepository.save(inventory);
    }
    
    public Inventory updateStockByProduct(Long productId, Integer stock) {
        Inventory inventory = getInventoryByProductId(productId);
        inventory.setStock(stock);
        return inventoryRepository.save(inventory);
    }
    
    @Transactional
    public Inventory decreaseStock(Long productId, Integer quantity) {
        Inventory inventory = getInventoryByProductId(productId);
        
        if (inventory.getStock() < quantity) {
            throw new RuntimeException("Insufficient stock. Available: " + inventory.getStock() + ", Requested: " + quantity);
        }
        
        inventory.setStock(inventory.getStock() - quantity);
        return inventoryRepository.save(inventory);
    }
    
    public void deleteInventory(Long id) {
        inventoryRepository.deleteById(id);
    }
    
    // DTO conversion methods
    public List<InventoryDto> getAllInventoryDtos() {
        return inventoryRepository.findAll().stream()
                .map(this::convertToDto)
                .collect(Collectors.toList());
    }
    
    public InventoryDto getInventoryDtoById(Long id) {
        Inventory inventory = getInventoryById(id);
        return convertToDto(inventory);
    }
    
    public InventoryDto getInventoryDtoByProductId(Long productId) {
        Inventory inventory = getInventoryByProductId(productId);
        return convertToDto(inventory);
    }
    
    public List<InventoryDto> getLowStockItemsDtos(Integer threshold) {
        return inventoryRepository.findByStockLessThanEqual(threshold).stream()
                .map(this::convertToDto)
                .collect(Collectors.toList());
    }
    
    public InventoryDto convertToDto(Inventory inventory) {
        InventoryDto dto = new InventoryDto();
        dto.setId(inventory.getId());
        dto.setProductId(inventory.getProduct().getId());
        dto.setProductName(inventory.getProduct().getName());
        dto.setStock(inventory.getStock());
        dto.setUpdatedAt(inventory.getUpdatedAt());
        return dto;
    }
}
