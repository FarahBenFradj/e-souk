package com.esouk;

import com.esouk.dto.Cart;
import com.esouk.dto.CartItem;
import org.junit.jupiter.api.Test;
import java.math.BigDecimal;
import static org.junit.jupiter.api.Assertions.*;

class CartTest {

    @Test
    void testAddItemToCart() {
        Cart cart = new Cart();
        CartItem item = CartItem.builder()
                .productId(1L).productName("Jarre Nabeul")
                .price(new BigDecimal("45.000")).quantity(2).build();

        cart.addItem(item);

        assertEquals(1, cart.getItemList().size());
        assertEquals(2, cart.getTotalItems());
        assertEquals(new BigDecimal("90.000"), cart.getTotalPrice());
    }

    @Test
    void testUpdateQuantity() {
        Cart cart = new Cart();
        CartItem item = CartItem.builder()
                .productId(1L).productName("Tapis Kairouan")
                .price(new BigDecimal("350.000")).quantity(1).build();

        cart.addItem(item);
        cart.updateQuantity(1L, 3);

        assertEquals(3, cart.getItemList().get(0).getQuantity());
    }

    @Test
    void testRemoveItem() {
        Cart cart = new Cart();
        CartItem item = CartItem.builder()
                .productId(42L).productName("Collier Sfax")
                .price(new BigDecimal("85.000")).quantity(1).build();

        cart.addItem(item);
        cart.removeItem(42L);

        assertTrue(cart.isEmpty());
    }

    @Test
    void testCartTotal() {
        Cart cart = new Cart();
        cart.addItem(CartItem.builder().productId(1L).productName("A")
                .price(new BigDecimal("10.000")).quantity(2).build());
        cart.addItem(CartItem.builder().productId(2L).productName("B")
                .price(new BigDecimal("5.500")).quantity(3).build());

        assertEquals(new BigDecimal("36.500"), cart.getTotalPrice());
    }
}
