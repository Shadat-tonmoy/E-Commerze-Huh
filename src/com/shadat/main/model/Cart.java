package com.shadat.main.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private static List<CartItem> cartItems;
    private static Cart instance = null;

    private Cart() {
        cartItems = new ArrayList<CartItem>();
    }

    public static Cart getInstance()
    {
        if(instance==null)
            instance = new Cart();
        return instance;


    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<CartItem> cartItems) {
        this.cartItems = cartItems;
    }
}
