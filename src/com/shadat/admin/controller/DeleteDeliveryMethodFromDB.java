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

@WebServlet(name = "DeleteDeliveryMethodFromDB")
public class DeleteDeliveryMethodFromDB extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String deleteId = request.getParameter("delete");
        Database database = new Database();
        boolean result = database.deleteDeliveryMethod(deleteId);
        if(result)
        {
            RequestDispatcher rd = request.getRequestDispatcher("delivery-methods");
            //rd.forward(request, response);
            HttpSession session = request.getSession(false);
            session.setAttribute("deletedDeliveryMethod", true);
            response.sendRedirect("delivery-methods");
        }
    }
}
