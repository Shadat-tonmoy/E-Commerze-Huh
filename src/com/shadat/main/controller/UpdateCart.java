package com.shadat.main.controller;

import com.shadat.main.model.Cart;
import com.shadat.main.model.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateCart")
public class UpdateCart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String amount = request.getParameter("quantity");
        System.out.println("ID " + id + " Amount " + amount);
        Cart cart = Cart.getInstance();
        cart.getCartItems().add(new CartItem(id,amount));
        HttpSession session = request.getSession(false);
        session.setAttribute("cart", cart);
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.print(1);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
