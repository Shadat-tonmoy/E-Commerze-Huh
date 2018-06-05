package com.shadat.admin.view;

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

@WebServlet(name = "EditDeliveryMethodView")
public class EditDeliveryMethodView extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if(session==null || session.getAttribute("admin")==null)
        {
            response.sendRedirect("/admin/");
        }
        else {

            String editId = request.getParameter("edit");
            System.out.println(editId);
            Database database = new Database();
            DeliveryMethod deliveryMethod = database.getDeliveryMethod(Integer.parseInt(editId));
            request.setAttribute("deliveryMethod",deliveryMethod);
            RequestDispatcher rd = request.getRequestDispatcher("delivery_method_edit_form_view.jsp");
            rd.include(request, response);
        }
    }
}
