package com.shopmanagement.service;

import com.shopmanagement.dto.ProductDto;
import com.shopmanagement.dto.ReviewDto;
import com.shopmanagement.entity.Category;
import com.shopmanagement.entity.Product;
import com.shopmanagement.entity.ProductCondition;
import com.shopmanagement.entity.Review;
import com.shopmanagement.repository.CategoryRepository;
import com.shopmanagement.repository.ProductRepository;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductService {
    
    private final ProductRepository productRepository;
    private final CategoryRepository categoryRepository;
    
    public ProductService(ProductRepository productRepository, CategoryRepository categoryRepository) {
        this.productRepository = productRepository;
        this.categoryRepository = categoryRepository;
    }
    
    public List<ProductDto> getAllProducts() {
        return productRepository.findAllWithSpecificationsAndReviews().stream()
                .map(this::convertToDto)
                .collect(Collectors.toList());
    }
    
    public ProductDto getProductById(Long id) {
        Product product = productRepository.findByIdWithSpecifications(id);
        if (product == null) {
            throw new RuntimeException("Product not found");
        }
        return convertToDto(product);
    }
    
    public List<ProductDto> getProductsByCategory(Long categoryId) {
        return productRepository.findByCategoryId(categoryId).stream()
                .map(this::convertToDto)
                .collect(Collectors.toList());
    }
    
    public List<ProductDto> searchProducts(String query) {
        return productRepository.findByNameContainingIgnoreCaseOrDescriptionContainingIgnoreCase(query, query)
                .stream()
                .map(this::convertToDto)
                .collect(Collectors.toList());
    }
    
    public List<ProductDto> filterProducts(ProductCondition condition, Long categoryId, 
                                         BigDecimal minPrice, BigDecimal maxPrice, Boolean inStock) {
        List<Product> products = productRepository.findAll();
        
        return products.stream()
                .filter(product -> condition == null || product.getCondition() == condition)
                .filter(product -> categoryId == null || 
                        (product.getCategory() != null && product.getCategory().getId().equals(categoryId)))
                .filter(product -> minPrice == null || product.getPrice().compareTo(minPrice) >= 0)
                .filter(product -> maxPrice == null || product.getPrice().compareTo(maxPrice) <= 0)
                .filter(product -> inStock == null || 
                        (inStock && product.getStock() > 0) || (!inStock && product.getStock() == 0))
                .map(this::convertToDto)
                .collect(Collectors.toList());
    }
    
    public ProductDto createProduct(ProductDto productDto) {
        Category category = categoryRepository.findById(productDto.getCategoryId())
                .orElseThrow(() -> new RuntimeException("Category not found"));
        
        Product product = new Product();
        product.setName(productDto.getName());
        product.setDescription(productDto.getDescription());
        product.setPrice(productDto.getPrice());
        product.setCondition(productDto.getCondition());
        product.setStock(productDto.getStock());
        product.setCategory(category);
        
        Product savedProduct = productRepository.save(product);
        return convertToDto(savedProduct);
    }
    
    public ProductDto updateProduct(Long id, ProductDto productDto) {
        Product product = productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found"));
        
        Category category = categoryRepository.findById(productDto.getCategoryId())
                .orElseThrow(() -> new RuntimeException("Category not found"));
        
        product.setName(productDto.getName());
        product.setDescription(productDto.getDescription());
        product.setPrice(productDto.getPrice());
        product.setCondition(productDto.getCondition());
        product.setStock(productDto.getStock());
        product.setCategory(category);
        
        Product savedProduct = productRepository.save(product);
        return convertToDto(savedProduct);
    }
    
    public ProductDto updateProductStock(Long id, Integer stock) {
        Product product = productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found"));
        
        product.setStock(stock);
        Product savedProduct = productRepository.save(product);
        return convertToDto(savedProduct);
    }
    
    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }
    
    public ProductDto convertToDto(Product product) {
        ProductDto dto = new ProductDto();
        dto.setId(product.getId());
        dto.setName(product.getName());
        dto.setDescription(product.getDescription());
        dto.setPrice(product.getPrice());
        dto.setOldPrice(product.getOldPrice());
        dto.setCondition(product.getCondition());
        dto.setStock(product.getStock());
        dto.setImageUrl(product.getImageUrl());
        dto.setImages(product.getImages());
        dto.setTags(product.getTags());
        
        // Set specifications from the new product_specifications table
        dto.setSpecifications(product.getSpecifications());
        
        dto.setWarrantyAndReturnPolicy(product.getWarrantyAndReturnPolicy());
        
        // Convert reviews to DTOs
        if (product.getReviews() != null) {
            List<ReviewDto> reviewDtos = product.getReviews().stream()
                    .map(this::convertReviewToDto)
                    .collect(Collectors.toList());
            dto.setReviews(reviewDtos);
        }
        
        if (product.getCategory() != null) {
            dto.setCategoryId(product.getCategory().getId());
            dto.setCategoryName(product.getCategory().getName());
        }
        return dto;
    }
    
    private ReviewDto convertReviewToDto(Review review) {
        return ReviewDto.builder()
                .id(review.getId())
                .authorName(review.getAuthorName())
                .rating(review.getRating())
                .comment(review.getComment())
                .createdAt(review.getCreatedAt())
                .build();
    }
}
