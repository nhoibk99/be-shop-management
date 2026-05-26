package com.shopmanagement.service;

import com.shopmanagement.entity.Category;
import com.shopmanagement.repository.CategoryRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {
    
    private final CategoryRepository categoryRepository;
    
    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }
    
    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }
    
    public Category getCategoryById(Long id) {
        return categoryRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Category not found"));
    }
    
    public List<Category> getCategoryWithProducts(Long id) {
        Category category = getCategoryById(id);
        // This will load the products due to the @OneToMany relationship
        return List.of(category);
    }
    
    public List<Category> searchCategoriesByName(String name) {
        return categoryRepository.findByNameContainingIgnoreCase(name);
    }
    
    public Category createCategory(Category category) {
        // Check if category with same name already exists
        if (categoryRepository.findByName(category.getName()) != null) {
            throw new RuntimeException("Category with this name already exists");
        }
        return categoryRepository.save(category);
    }
    
    public Category updateCategory(Long id, Category category) {
        Category existingCategory = getCategoryById(id);
        
        // Check if new name conflicts with existing category
        Category categoryWithSameName = categoryRepository.findByName(category.getName());
        if (categoryWithSameName != null && !categoryWithSameName.getId().equals(id)) {
            throw new RuntimeException("Category with this name already exists");
        }
        
        existingCategory.setName(category.getName());
        return categoryRepository.save(existingCategory);
    }
    
    public void deleteCategory(Long id) {
        Category category = getCategoryById(id);
        
        // Check if category has products
        if (!category.getProducts().isEmpty()) {
            throw new RuntimeException("Cannot delete category with existing products");
        }
        
        categoryRepository.deleteById(id);
    }
}
