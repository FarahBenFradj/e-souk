package com.esouk.service;

import com.esouk.dto.Cart;
import com.esouk.dto.CartItem;
import com.esouk.model.Product;
import com.esouk.repository.ProductRepository;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CartService {

    private static final String CART_SESSION_KEY = "cart";
    private final ProductRepository productRepository;

    public Cart getCart(HttpSession session) {
        Cart cart = (Cart) session.getAttribute(CART_SESSION_KEY);
        if (cart == null) {
            cart = new Cart();
            session.setAttribute(CART_SESSION_KEY, cart);
        }
        return cart;
    }

    public Cart addToCart(HttpSession session, Long productId, int quantity) {
        Cart cart = getCart(session);
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Produit introuvable"));

        if (!product.isActive() || product.getStock() < quantity) {
            throw new RuntimeException("Stock insuffisant");
        }

        CartItem item = CartItem.builder()
                .productId(product.getId())
                .productName(product.getName())
                .imageUrl(product.getImageUrl())
                .price(product.getPrice())
                .quantity(quantity)
                .artisan(product.getArtisan())
                .build();

        cart.addItem(item);
        session.setAttribute(CART_SESSION_KEY, cart);
        return cart;
    }

    public Cart updateQuantity(HttpSession session, Long productId, int quantity) {
        Cart cart = getCart(session);
        cart.updateQuantity(productId, quantity);
        session.setAttribute(CART_SESSION_KEY, cart);
        return cart;
    }

    public Cart removeItem(HttpSession session, Long productId) {
        Cart cart = getCart(session);
        cart.removeItem(productId);
        session.setAttribute(CART_SESSION_KEY, cart);
        return cart;
    }

    public void clearCart(HttpSession session) {
        session.removeAttribute(CART_SESSION_KEY);
    }
}
