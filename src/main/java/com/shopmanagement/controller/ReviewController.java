package com.shopmanagement.controller;

import com.shopmanagement.dto.ReviewDto;
import com.shopmanagement.service.ReviewService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/reviews")
@RequiredArgsConstructor
public class ReviewController {
    
    private final ReviewService reviewService;
    
    @GetMapping("/products/{productId}/reviews")
    public ResponseEntity<List<ReviewDto>> getReviewsByProductId(@PathVariable Long productId) {
        List<ReviewDto> reviews = reviewService.getReviewsByProductId(productId);
        return ResponseEntity.ok(reviews);
    }
    
    @PostMapping("/products/{productId}/reviews")
    public ResponseEntity<ReviewDto> addReview(
            @PathVariable Long productId,
            @Valid @RequestBody ReviewDto reviewDto) {
        ReviewDto savedReview = reviewService.addReview(productId, reviewDto);
        return ResponseEntity.status(HttpStatus.CREATED).body(savedReview);
    }
    
    @DeleteMapping("/reviews/{reviewId}")
    public ResponseEntity<Void> deleteReview(@PathVariable Long reviewId) {
        reviewService.deleteReview(reviewId);
        return ResponseEntity.noContent().build();
    }
}
