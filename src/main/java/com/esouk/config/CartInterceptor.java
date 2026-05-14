package com.esouk.config;

import com.esouk.dto.Cart;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * Injecte le panier dans chaque vue JSP via ${cart}
 * pour afficher le badge panier dans la navbar.
 */
@Component
public class CartInterceptor implements HandlerInterceptor {

    @Override
    public void postHandle(HttpServletRequest request,
                           HttpServletResponse response,
                           Object handler,
                           ModelAndView modelAndView) {

        if (modelAndView != null && !modelAndView.isEmpty()) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                Cart cart = (Cart) session.getAttribute("cart");
                if (cart != null) {
                    modelAndView.addObject("cart", cart);
                }
            }
        }
    }
}
