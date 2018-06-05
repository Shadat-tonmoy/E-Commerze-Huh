package com.shadat.main.view;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "CheckoutFinalReview")
public class CheckoutFinalReview extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("paymentMethod")!=null)
        {
            int paymentMethod= Integer.parseInt(request.getParameter("paymentMethod"));
            HttpSession session = request.getSession(false);
            session.setAttribute("paymentMethod", paymentMethod);
        }
        RequestDispatcher rd = request.getRequestDispatcher("/static/checkoutFinalReview.jsp");
        rd.include(request, response);
    }
}
