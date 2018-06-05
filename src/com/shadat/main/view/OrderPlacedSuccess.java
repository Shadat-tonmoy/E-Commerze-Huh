package com.shadat.main.view;

import com.shadat.database.Database;
import com.shadat.main.model.Cart;
import com.shadat.main.model.CartItem;
import com.shadat.main.model.Order;
import com.shadat.main.model.OrderUserDetail;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderPlacedSuccess")
public class OrderPlacedSuccess extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Database database = new Database();
        HttpSession session = request.getSession(false);
        OrderUserDetail orderUserDetail = (OrderUserDetail) session.getAttribute("userDetail");
        int deliveryMethodId = (int) session.getAttribute("deliveryMethod");
        int paymentMethodId = (int) session.getAttribute("paymentMethod");
        Cart cart = (Cart) session.getAttribute("cart");
        Order order = new Order(orderUserDetail,deliveryMethodId,paymentMethodId,cart);
        String orderNumber = database.addOrderToDB(order);
        session.setAttribute("orderNumber",orderNumber);
        RequestDispatcher rd = request.getRequestDispatcher("/static/orderPlacedSuccess.jsp");
        rd.include(request, response);
    }
}
