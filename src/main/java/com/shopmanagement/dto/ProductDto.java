package com.shopmanagement.dto;

import com.shopmanagement.entity.ProductCondition;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductDto {
    
    private Long id;
    
    @NotBlank(message = "Product name is required")
    @Size(min = 2, max = 200, message = "Product name must be between 2 and 200 characters")
    private String name;
    
    @Size(max = 1000, message = "Description cannot exceed 1000 characters")
    private String description;
    
    @NotNull(message = "Price is required")
    @Positive(message = "Price must be positive")
    private BigDecimal price;
    
    private BigDecimal oldPrice;
    
    private ProductCondition condition;
    
    @NotNull(message = "Stock is required")
    @Positive(message = "Stock must be positive")
    private Integer stock;
    
    private Long categoryId;
    private String categoryName;
    
    private String imageUrl;
    private String specs;
    
    private List<String> images;
    private List<String> tags;
    private Map<String, String> specifications;
    private String warrantyAndReturnPolicy;
    private List<ReviewDto> reviews;
    
    // Computed fields based on condition
    public String getLabel() {
        if (condition == null) return "new";
        return condition == ProductCondition.USED ? "used" : "new";
    }
    
    public String getLabelText() {
        return condition != null ? condition.name() : "NEW";
    }
}
