package com.shadat.main.view;

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
import java.util.List;

@WebServlet(name = "CartView")
public class CartView extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/static/cart.jsp");
        rd.include(request, response);
        HttpSession session = request.getSession(false);
        Cart cart = (Cart) session.getAttribute("cart");
        List<CartItem> cartItems = cart.getCartItems();

        response.setContentType("text/html");

    }
}
