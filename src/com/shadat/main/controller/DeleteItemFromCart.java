package com.shadat.main.controller;

import com.shadat.main.model.Cart;
import com.shadat.main.model.CartItem;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "DeleteItemFromCart")
public class DeleteItemFromCart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String amount = request.getParameter("quantity");
        System.out.println("ID " + id + " Amount " + amount);
        Cart cart = Cart.getInstance();
        List<CartItem> cartItems = cart.getCartItems();
        int i=0;
        for(CartItem cartItem:cartItems)
        {
            if(cartItem.getProductId().equals(id))
            {
                cartItems.remove(i);
                break;
            }
            i++;
        }
        HttpSession session = request.getSession(false);
        session.setAttribute("cart", cart);
        response.sendRedirect("/cart");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }
}
