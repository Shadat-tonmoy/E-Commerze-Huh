package com.shadat.admin.controller;

import com.shadat.admin.model.DeliveryMethod;
import com.shadat.database.Database;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "EditDeliveryChargeToDB")
public class EditDeliveryChargeToDB extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String deliveryCharge= request.getParameter("deliveryCharge");
        Database database = new Database();
        boolean isUpdated = database.updateDeliveryCharge(deliveryCharge);
        if (isUpdated) {
            RequestDispatcher rd = request.getRequestDispatcher("delivery-charge");
            //rd.forward(request, response);
            HttpSession session = request.getSession(false);
            session.setAttribute("updateDeliveryCharge", true);
            session.setAttribute("updateDeliveryChargeValue", deliveryCharge);
            response.sendRedirect("delivery-charge");
        } else {
            System.out.println("Error");

        }

    }
}
