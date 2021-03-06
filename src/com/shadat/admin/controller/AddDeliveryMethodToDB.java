package com.shadat.admin.controller;

import com.shadat.admin.model.DeliveryMethod;
import com.shadat.admin.model.Product;
import com.shadat.database.Database;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AddDeliveryMethodToDB")
public class AddDeliveryMethodToDB extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String title = request.getParameter("title");
        String time = request.getParameter("time");
        DeliveryMethod deliveryMethod = new DeliveryMethod(title,time);
        Database database = new Database();
        boolean isAdded = database.addDeliveryMethod(deliveryMethod);
        if(isAdded)
        {
            System.out.println("Added");
            RequestDispatcher rd = request.getRequestDispatcher("delivery-methods");
            //rd.forward(request, response);
            HttpSession session = request.getSession(false);
            session.setAttribute("newDeliveryMethod",true);
            session.setAttribute("deliveryMethodTitle",title);
            response.sendRedirect("delivery-methods");
        }
        else
        {

        }
    }
}
