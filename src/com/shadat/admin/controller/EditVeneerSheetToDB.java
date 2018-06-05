package com.shadat.admin.controller;

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

@WebServlet(name = "EditVeneerSheetToDB")
public class EditVeneerSheetToDB extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        int id = Integer.parseInt(request.getParameter("productId"));
        String title = request.getParameter("title");
        double price = Double.parseDouble(request.getParameter("price"));
        String available = request.getParameter("available");
        double discount = Double.parseDouble(request.getParameter("discount"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        String description = request.getParameter("description");
        String fname = request.getParameter("fname");
        boolean isAvailable = available==null ? false : true;
        if (!isAvailable)
            stock = 0;

        Product product = new Product(id,title, description, fname, price, discount, isAvailable, stock);
        System.out.println(" " + title + " " + price + " " + isAvailable + " " + discount + " " + description + " " + fname+" "+stock);
        Database database = new Database();
        database.createConnection();
        boolean isUpdated = database.updateProduct(product);
        if (isUpdated) {
            System.out.println("Updated...");
            RequestDispatcher rd = request.getRequestDispatcher("admin/veneer-sheet");
            //rd.forward(request, response);
            HttpSession session = request.getSession(false);
            session.setAttribute("updateProduct", true);
            session.setAttribute("updatedProductTitle", title);
            response.sendRedirect("admin/veneer-sheet");
        } else {
            System.out.println("Error");

        }

    }
}
