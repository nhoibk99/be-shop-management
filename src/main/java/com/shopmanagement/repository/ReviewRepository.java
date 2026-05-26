package com.shopmanagement.repository;

import com.shopmanagement.entity.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long> {
    
    List<Review> findByProductIdOrderByCreatedAtDesc(Long productId);
    
    void deleteByProductId(Long productId);
}
