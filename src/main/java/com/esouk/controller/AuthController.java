package com.esouk.controller;

import com.esouk.model.User;
import com.esouk.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
public class AuthController {

    private final UserService userService;

    @GetMapping("/login")
    public String loginPage(@RequestParam(required = false) String error,
                            @RequestParam(required = false) String logout,
                            Model model) {
        
        if (error != null) {
            model.addAttribute("error", "Email ou mot de passe incorrect.");
        }
        if (logout != null) {
            model.addAttribute("logout", "Vous avez été déconnecté.");
        }
        
        model.addAttribute("pageTitle", "Connexion - E-Souk");
        return "auth/login";        // ← Important : doit correspondre au dossier + nom du fichier
    }

    @GetMapping("/register")
    public String registerPage(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("pageTitle", "Inscription - E-Souk");
        return "auth/register";
    }

    @PostMapping("/register")
    public String doRegister(@ModelAttribute User user,
                             @RequestParam String confirmPassword,
                             RedirectAttributes redirectAttributes) {
        try {
            if (!user.getPassword().equals(confirmPassword)) {
                redirectAttributes.addFlashAttribute("error", "Les mots de passe ne correspondent pas.");
                return "redirect:/register";
            }
            userService.register(user);
            redirectAttributes.addFlashAttribute("success", "Compte créé ! Connectez-vous.");
            return "redirect:/login";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            return "redirect:/register";
        }
    }

    @GetMapping("/profile")
    public String profile(Authentication auth, Model model) {
        User user = userService.findByEmail(auth.getName()).orElseThrow();
        model.addAttribute("user", user);
        model.addAttribute("pageTitle", "Mon Profil - E-Souk");
        return "auth/profile";
    }

    @PostMapping("/profile")
    public String updateProfile(@ModelAttribute User formUser,
                                Authentication auth,
                                RedirectAttributes redirectAttributes) {
        try {
            User existing = userService.findByEmail(auth.getName()).orElseThrow();
            existing.setFirstName(formUser.getFirstName());
            existing.setLastName(formUser.getLastName());
            existing.setPhone(formUser.getPhone());
            existing.setAddress(formUser.getAddress());
            userService.update(existing);
            redirectAttributes.addFlashAttribute("success", "Profil mis à jour !");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/profile";
    }
}
