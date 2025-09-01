package com.shopmanagement.dto;

import com.shopmanagement.entity.OrderStatus;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderDto {
    
    private Long id;
    
    private Long userId;
    
    private OrderStatus status;
    
    private BigDecimal totalAmount;
    
    private LocalDateTime createdAt;
    
    @NotNull(message = "Order items are required")
    @Size(min = 1, message = "Order must contain at least one item")
    @Valid
    private List<OrderItemDto> orderItems;
}
