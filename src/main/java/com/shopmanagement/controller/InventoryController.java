package com.shopmanagement.controller;

import com.shopmanagement.dto.InventoryDto;
import com.shopmanagement.entity.Inventory;
import com.shopmanagement.entity.Product;
import com.shopmanagement.repository.ProductRepository;
import com.shopmanagement.service.InventoryService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/inventory")
@CrossOrigin(origins = "*")
public class InventoryController {
    
    private final InventoryService inventoryService;
    private final ProductRepository productRepository;
    
    public InventoryController(InventoryService inventoryService, ProductRepository productRepository) {
        this.inventoryService = inventoryService;
        this.productRepository = productRepository;
    }
    
    @GetMapping
    @PreAuthorize("hasAnyRole('ADMIN', 'STAFF')")
    public ResponseEntity<List<InventoryDto>> getAllInventory() {
        return ResponseEntity.ok(inventoryService.getAllInventoryDtos());
    }
    
    @GetMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMIN', 'STAFF')")
    public ResponseEntity<InventoryDto> getInventoryById(@PathVariable Long id) {
        return ResponseEntity.ok(inventoryService.getInventoryDtoById(id));
    }
    
    @GetMapping("/product/{productId}")
    @PreAuthorize("hasAnyRole('ADMIN', 'STAFF')")
    public ResponseEntity<InventoryDto> getInventoryByProductId(@PathVariable Long productId) {
        return ResponseEntity.ok(inventoryService.getInventoryDtoByProductId(productId));
    }
    
    @GetMapping("/low-stock")
    @PreAuthorize("hasAnyRole('ADMIN', 'STAFF')")
    public ResponseEntity<List<InventoryDto>> getLowStockItems(@RequestParam(defaultValue = "10") Integer threshold) {
        return ResponseEntity.ok(inventoryService.getLowStockItemsDtos(threshold));
    }
    
    @PostMapping
    @PreAuthorize("hasAnyRole('ADMIN', 'STAFF')")
    public ResponseEntity<InventoryDto> createInventory(@Valid @RequestBody InventoryDto inventoryDto) {
        Inventory inventory = new Inventory();
        Product product = productRepository.findById(inventoryDto.getProductId())
                .orElseThrow(() -> new RuntimeException("Product not found"));
        inventory.setProduct(product);
        inventory.setStock(inventoryDto.getStock());
        
        Inventory savedInventory = inventoryService.createInventory(inventory);
        return ResponseEntity.ok(inventoryService.convertToDto(savedInventory));
    }
    
    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMIN', 'STAFF')")
    public ResponseEntity<InventoryDto> updateInventory(@PathVariable Long id, @Valid @RequestBody InventoryDto inventoryDto) {
        Inventory inventory = inventoryService.getInventoryById(id);
        inventory.setStock(inventoryDto.getStock());
        Inventory savedInventory = inventoryService.updateInventory(id, inventory);
        return ResponseEntity.ok(inventoryService.convertToDto(savedInventory));
    }
    
    @PutMapping("/{id}/stock")
    @PreAuthorize("hasAnyRole('ADMIN', 'STAFF')")
    public ResponseEntity<InventoryDto> updateStock(@PathVariable Long id, @RequestParam Integer stock) {
        Inventory inventory = inventoryService.updateStock(id, stock);
        return ResponseEntity.ok(inventoryService.convertToDto(inventory));
    }
    
    @PutMapping("/product/{productId}/stock")
    @PreAuthorize("hasAnyRole('ADMIN', 'STAFF')")
    public ResponseEntity<InventoryDto> updateStockByProduct(@PathVariable Long productId, @RequestParam Integer stock) {
        Inventory inventory = inventoryService.updateStockByProduct(productId, stock);
        return ResponseEntity.ok(inventoryService.convertToDto(inventory));
    }
    
    @PutMapping("/product/{productId}/decrease")
    @PreAuthorize("hasAnyRole('ADMIN', 'STAFF')")
    public ResponseEntity<InventoryDto> decreaseStock(@PathVariable Long productId, @RequestParam Integer quantity) {
        Inventory inventory = inventoryService.decreaseStock(productId, quantity);
        return ResponseEntity.ok(inventoryService.convertToDto(inventory));
    }
    
    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<Void> deleteInventory(@PathVariable Long id) {
        inventoryService.deleteInventory(id);
        return ResponseEntity.noContent().build();
    }
}
