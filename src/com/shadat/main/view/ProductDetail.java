package com.shadat.main.view;

import com.shadat.admin.model.Product;
import com.shadat.database.Database;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductDetail")
public class ProductDetail extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("ref");
        Database database = new Database();
        database.createConnection();
        Product product = database.getProduct(Integer.parseInt(id));
        System.out.println(product.toString());
        request.setAttribute("product",product);
        RequestDispatcher rd = request.getRequestDispatcher("/static/detail.jsp");
        rd.forward(request, response);

    }
}
