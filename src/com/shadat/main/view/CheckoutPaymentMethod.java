package com.shadat.main.view;

import com.shadat.admin.model.DeliveryMethod;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "CheckoutPaymentMethod")
public class CheckoutPaymentMethod extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("deliveryMethod")!=null)
        {
            int deliveryMethodId = Integer.parseInt(request.getParameter("deliveryMethod"));
            HttpSession session = request.getSession(false);
            session.setAttribute("deliveryMethod", deliveryMethodId);
        }
        RequestDispatcher rd = request.getRequestDispatcher("/static/checkoutPaymentMethod.jsp");
        rd.include(request, response);
    }
}
