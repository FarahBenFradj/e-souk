package com.esouk.controller;

import com.esouk.dto.Cart;
import com.esouk.model.Order;
import com.esouk.model.User;
import com.esouk.service.*;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class OrderController {

    private final OrderService orderService;
    private final CartService cartService;
    private final UserService userService;

    // --- Page checkout ---
    @GetMapping("/checkout")
    public String checkout(HttpSession session, Authentication auth, Model model) {
        Cart cart = cartService.getCart(session);
        if (cart.isEmpty()) return "redirect:/cart";

        User user = userService.findByEmail(auth.getName()).orElseThrow();
        model.addAttribute("cart", cart);
        model.addAttribute("user", user);
        model.addAttribute("pageTitle", "Commande - E-Souk");
        return "order/checkout";
    }

    // --- Confirmer la commande ---
    @PostMapping("/checkout")
    public String placeOrder(@RequestParam String shippingAddress,
                             @RequestParam String paymentMethod,
                             @RequestParam(required = false) String notes,
                             HttpSession session,
                             Authentication auth,
                             RedirectAttributes redirectAttributes) {
        try {
            Cart cart = cartService.getCart(session);
            if (cart.isEmpty()) return "redirect:/cart";

            Order order = orderService.createOrder(cart, auth.getName(),
                    shippingAddress, paymentMethod, notes);
            cartService.clearCart(session);

            redirectAttributes.addFlashAttribute("orderNumber", order.getOrderNumber());
            return "redirect:/orders/" + order.getId() + "/confirmation";

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            return "redirect:/checkout";
        }
    }

    // --- Confirmation de commande ---
    @GetMapping("/orders/{id}/confirmation")
    public String confirmation(@PathVariable Long id, Authentication auth, Model model) {
        Order order = orderService.findById(id);

        // Vérifier que c'est bien la commande de l'utilisateur connecté
        if (!order.getUser().getEmail().equals(auth.getName())) {
            return "redirect:/403";
        }

        model.addAttribute("order", order);
        model.addAttribute("pageTitle", "Commande confirmée - E-Souk");
        return "order/confirmation";
    }

    // --- Historique des commandes ---
    @GetMapping("/orders")
    public String myOrders(Authentication auth, Model model) {
        User user = userService.findByEmail(auth.getName()).orElseThrow();
        List<Order> orders = orderService.findByUser(user.getId());
        model.addAttribute("orders", orders);
        model.addAttribute("pageTitle", "Mes Commandes - E-Souk");
        return "order/list";
    }

    // --- Détail d'une commande ---
    @GetMapping("/orders/{id}")
    public String orderDetail(@PathVariable Long id, Authentication auth, Model model) {
        Order order = orderService.findById(id);

        if (!order.getUser().getEmail().equals(auth.getName())
                && !auth.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
            return "redirect:/403";
        }

        model.addAttribute("order", order);
        model.addAttribute("pageTitle", "Commande " + order.getOrderNumber() + " - E-Souk");
        return "order/detail";
    }
}
