package com.shopmanagement.service;

import com.shopmanagement.dto.ReviewDto;
import com.shopmanagement.entity.Product;
import com.shopmanagement.entity.Review;
import com.shopmanagement.repository.ProductRepository;
import com.shopmanagement.repository.ReviewRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional
public class ReviewService {
    
    private final ReviewRepository reviewRepository;
    private final ProductRepository productRepository;
    
    @Transactional(readOnly = true)
    public List<ReviewDto> getReviewsByProductId(Long productId) {
        return reviewRepository.findByProductIdOrderByCreatedAtDesc(productId)
                .stream()
                .map(this::convertToDto)
                .collect(Collectors.toList());
    }
    
    public ReviewDto addReview(Long productId, ReviewDto reviewDto) {
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Product not found with id: " + productId));
        
        Review review = Review.builder()
                .product(product)
                .authorName(reviewDto.getAuthorName())
                .rating(reviewDto.getRating())
                .comment(reviewDto.getComment())
                .build();
        
        Review savedReview = reviewRepository.save(review);
        return convertToDto(savedReview);
    }
    
    public void deleteReview(Long reviewId) {
        if (!reviewRepository.existsById(reviewId)) {
            throw new RuntimeException("Review not found with id: " + reviewId);
        }
        reviewRepository.deleteById(reviewId);
    }
    
    private ReviewDto convertToDto(Review review) {
        return ReviewDto.builder()
                .id(review.getId())
                .authorName(review.getAuthorName())
                .rating(review.getRating())
                .comment(review.getComment())
                .createdAt(review.getCreatedAt())
                .build();
    }
}
