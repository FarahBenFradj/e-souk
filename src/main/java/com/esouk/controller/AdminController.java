package com.esouk.controller;

import com.esouk.model.*;
import com.esouk.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin")
@PreAuthorize("hasRole('ADMIN')")
@RequiredArgsConstructor
public class AdminController {

    private final ProductService productService;
    private final OrderService orderService;
    private final UserService userService;

    // ===== DASHBOARD =====
    @GetMapping({"/", "/dashboard"})
    public String dashboard(Model model) {
        model.addAttribute("totalProducts", productService.countActive());
        model.addAttribute("totalOrders", orderService.countAll());
        model.addAttribute("totalUsers", userService.countAll());
        model.addAttribute("totalRevenue", orderService.getTotalRevenue());
        model.addAttribute("pendingOrders", orderService.countByStatus(Order.OrderStatus.EN_ATTENTE));
        model.addAttribute("lowStock", productService.countLowStock());
        model.addAttribute("recentOrders", orderService.findAll().stream().limit(10).toList());
        model.addAttribute("pageTitle", "Dashboard Admin - E-Souk");
        return "admin/dashboard";
    }

    // ===== PRODUITS =====
    @GetMapping("/products")
    public String adminProducts(Model model) {
        model.addAttribute("products", productService.findAll());
        model.addAttribute("pageTitle", "Gestion Produits - Admin");
        return "admin/products";
    }

    @GetMapping("/products/new")
    public String newProductForm(Model model) {
        model.addAttribute("product", new Product());
        model.addAttribute("categories", productService.findAllCategories());
        model.addAttribute("pageTitle", "Nouveau Produit - Admin");
        return "admin/product-form";
    }

    @GetMapping("/products/{id}/edit")
    public String editProductForm(@PathVariable Long id, Model model) {
        Product product = productService.findById(id)
                .orElseThrow(() -> new RuntimeException("Produit introuvable"));
        model.addAttribute("product", product);
        model.addAttribute("categories", productService.findAllCategories());
        model.addAttribute("pageTitle", "Modifier Produit - Admin");
        return "admin/product-form";
    }

    @PostMapping("/products/save")
    public String saveProduct(@ModelAttribute Product product,
                              @RequestParam Long categoryId,
                              RedirectAttributes ra) {
        try {
            Category cat = productService.findCategoryById(categoryId)
                    .orElseThrow(() -> new RuntimeException("Catégorie introuvable"));
            product.setCategory(cat);
            productService.save(product);
            ra.addFlashAttribute("success", "Produit enregistré avec succès !");
        } catch (Exception e) {
            ra.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/admin/products";
    }

    @PostMapping("/products/{id}/delete")
    public String deleteProduct(@PathVariable Long id, RedirectAttributes ra) {
        productService.delete(id);
        ra.addFlashAttribute("success", "Produit désactivé.");
        return "redirect:/admin/products";
    }

    // ===== CATÉGORIES =====
    @GetMapping("/categories")
    public String adminCategories(Model model) {
        model.addAttribute("categories", productService.findAllCategories());
        model.addAttribute("newCategory", new Category());
        model.addAttribute("pageTitle", "Catégories - Admin");
        return "admin/categories";
    }

    @PostMapping("/categories/save")
    public String saveCategory(@ModelAttribute Category category, RedirectAttributes ra) {
        if (category.getSlug() == null || category.getSlug().isBlank()) {
            category.setSlug(category.getName().toLowerCase()
                    .replaceAll("[^a-z0-9]", "-").replaceAll("-+", "-"));
        }
        productService.saveCategory(category);
        ra.addFlashAttribute("success", "Catégorie enregistrée !");
        return "redirect:/admin/categories";
    }

    // ===== COMMANDES =====
    @GetMapping("/orders")
    public String adminOrders(Model model) {
        model.addAttribute("orders", orderService.findAll());
        model.addAttribute("statuses", Order.OrderStatus.values());
        model.addAttribute("pageTitle", "Gestion Commandes - Admin");
        return "admin/orders";
    }

    @PostMapping("/orders/{id}/status")
    public String updateOrderStatus(@PathVariable Long id,
                                    @RequestParam Order.OrderStatus status,
                                    RedirectAttributes ra) {
        orderService.updateStatus(id, status);
        ra.addFlashAttribute("success", "Statut mis à jour !");
        return "redirect:/admin/orders";
    }

    // ===== UTILISATEURS =====
    @GetMapping("/users")
    public String adminUsers(Model model) {
        model.addAttribute("users", userService.countAll());
        model.addAttribute("pageTitle", "Utilisateurs - Admin");
        return "admin/users";
    }
}
