package com.shopmanagement.repository;

import com.shopmanagement.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> findByCategoryId(Long categoryId);
    List<Product> findByNameContainingIgnoreCaseOrDescriptionContainingIgnoreCase(String name, String description);
    
    @Query("SELECT p FROM Product p LEFT JOIN FETCH p.specifications WHERE p.id = :id")
    Product findByIdWithSpecifications(@Param("id") Long id);
    
    @Query("SELECT p FROM Product p LEFT JOIN FETCH p.specifications LEFT JOIN FETCH p.reviews")
    List<Product> findAllWithSpecificationsAndReviews();
}
