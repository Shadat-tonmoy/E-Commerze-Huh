package com.shadat.admin.controller;

import com.shadat.database.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateOrderStatus")
public class UpdateOrderStatus extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String updatedValue = request.getParameter("updatedValue");
        Database database = new Database();
        boolean result = database.updateOrderStatus(id,updatedValue);
        System.out.println("Updating iw "+id+" "+updatedValue);
        if(result)
        {
            PrintWriter out = response.getWriter();
            out.print(1);
        }
        else
        {
            PrintWriter out = response.getWriter();
            out.print(0);

        }

    }
}
