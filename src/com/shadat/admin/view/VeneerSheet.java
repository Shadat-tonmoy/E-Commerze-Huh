package com.shadat.admin.view;

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
import java.util.List;

@WebServlet(name = "VeneerSheet")
public class VeneerSheet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if(session==null || session.getAttribute("admin")==null)
        {
            response.sendRedirect("/admin/");
        }
        else
        {

            Database database = new Database();
            database.createConnection();
            List<Product> products = database.getProducts();
            database.closeConnection();
            if(products.size()>0)
            {
                request.setAttribute("products",products);

                RequestDispatcher rd = request.getRequestDispatcher("veneer_sheet_view.jsp");
                rd.include(request, response);
            }
            else {
                RequestDispatcher rd = request.getRequestDispatcher("no_veneer_sheet_found_view.jsp");
                rd.include(request, response);

            }
        }



    }
}
