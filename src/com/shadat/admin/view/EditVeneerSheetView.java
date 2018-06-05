package com.shadat.admin.view;

import com.shadat.admin.model.Product;
import com.shadat.database.Database;
import org.omg.Messaging.SYNC_WITH_TRANSPORT;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "EditVeneerSheetView")
public class EditVeneerSheetView extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if(session==null || session.getAttribute("admin")==null)
        {
            response.sendRedirect("/admin/");
        }
        else
        {
            String editId = request.getParameter("edit");
            System.out.println(editId);
            Database database = new Database();
            database.createConnection();
            Product product = database.getProduct(Integer.parseInt(editId));
            database.closeConnection();
            System.out.println(product.toString());
            request.setAttribute("product",product);
            RequestDispatcher rd = request.getRequestDispatcher("veneer_sheet_edit_form_view.jsp");
            rd.include(request, response);
        }




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
