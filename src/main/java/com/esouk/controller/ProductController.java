package com.esouk.controller;

import com.esouk.model.Category;
import com.esouk.model.Product;
import com.esouk.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class ProductController {

    private final ProductService productService;

    // --- Catalogue complet ---
    @GetMapping("/products")
    public String catalogue(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "12") int size,
            @RequestParam(required = false) Long categoryId,
            Model model) {

        Page<Product> productPage;
        if (categoryId != null) {
            List<Product> byCat = productService.findByCategory(categoryId);
            model.addAttribute("products", byCat);
            model.addAttribute("selectedCategory", productService.findCategoryById(categoryId).orElse(null));
        } else {
            productPage = productService.findAllPaged(page, size);
            model.addAttribute("products", productPage.getContent());
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", productPage.getTotalPages());
            model.addAttribute("totalItems", productPage.getTotalElements());
        }

        model.addAttribute("categories", productService.findAllCategories());
        model.addAttribute("categoryId", categoryId);
        model.addAttribute("pageTitle", "Catalogue - E-Souk");
        return "product/list";
    }

    // --- Détail produit ---
    @GetMapping("/products/{id}")
    public String detail(@PathVariable Long id, Model model) {
        Product product = productService.findById(id)
                .orElseThrow(() -> new RuntimeException("Produit introuvable"));

        // Produits similaires (même catégorie)
        List<Product> similar = productService.findByCategory(product.getCategory().getId())
                .stream().filter(p -> !p.getId().equals(id)).limit(4).toList();

        model.addAttribute("product", product);
        model.addAttribute("similarProducts", similar);
        model.addAttribute("pageTitle", product.getName() + " - E-Souk");
        return "product/detail";
    }

    // --- Recherche ---
    @GetMapping("/search")
    public String search(@RequestParam String q, Model model) {
        List<Product> results = productService.search(q);
        model.addAttribute("products", results);
        model.addAttribute("keyword", q);
        model.addAttribute("resultCount", results.size());
        model.addAttribute("categories", productService.findAllCategories());
        model.addAttribute("pageTitle", "Résultats pour \"" + q + "\" - E-Souk");
        return "product/search";
    }

    // --- Produits par catégorie ---
    @GetMapping("/categories/{slug}")
    public String byCategory(@PathVariable String slug, Model model) {
        Category category = productService.findAllCategories().stream()
                .filter(c -> slug.equals(c.getSlug()))
                .findFirst()
                .orElseThrow(() -> new RuntimeException("Catégorie introuvable"));

        List<Product> products = productService.findByCategory(category.getId());
        model.addAttribute("products", products);
        model.addAttribute("category", category);
        model.addAttribute("categories", productService.findAllCategories());
        model.addAttribute("pageTitle", category.getName() + " - E-Souk");
        return "product/category";
    }
}
