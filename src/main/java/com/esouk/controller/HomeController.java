package com.esouk.controller;

import com.esouk.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final ProductService productService;

    
    @GetMapping({"/", "/home"})
    public String home(Model model) {
        model.addAttribute("featuredProducts", productService.findFeatured());
        model.addAttribute("categories", productService.findAllCategories());
        model.addAttribute("pageTitle", "E-Souk - Artisanat Tunisien Authentique");
        return "home";
    }

    @GetMapping("/403")
    public String accessDenied() {
        return "error/403";
    }
}
