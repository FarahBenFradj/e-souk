package com.esouk.service;

import com.esouk.model.Category;
import com.esouk.model.Product;
import com.esouk.repository.CategoryRepository;
import com.esouk.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductRepository productRepository;
    private final CategoryRepository categoryRepository;

    public List<Product> findAll() {
        return productRepository.findByActiveTrueOrderByCreatedAtDesc();
    }

    public Page<Product> findAllPaged(int page, int size) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());
        return productRepository.findByActiveTrue(pageable);
    }

    public Optional<Product> findById(Long id) {
        return productRepository.findById(id);
    }

    public List<Product> findFeatured() {
        return productRepository.findByFeaturedTrueAndActiveTrue();
    }

    public List<Product> findByCategory(Long categoryId) {
        return productRepository.findByCategoryIdAndActiveTrue(categoryId);
    }

    public List<Product> search(String keyword) {
        return productRepository.searchProducts(keyword);
    }

    public Product save(Product product) {
        return productRepository.save(product);
    }

    public void delete(Long id) {
        Product p = productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Produit introuvable"));
        p.setActive(false);
        productRepository.save(p);
    }

    public List<Category> findAllCategories() {
        return categoryRepository.findAll();
    }

    public Optional<Category> findCategoryById(Long id) {
        return categoryRepository.findById(id);
    }

    public Category saveCategory(Category category) {
        return categoryRepository.save(category);
    }

    public long countActive() {
        return productRepository.countByActiveTrue();
    }

    public long countLowStock() {
        return productRepository.countByStockLessThanAndActiveTrue(5);
    }
}
