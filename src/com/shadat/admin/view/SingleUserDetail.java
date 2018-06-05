package com.shadat.admin.view;

import com.shadat.database.Database;
import com.shadat.main.model.Order;
import com.shadat.main.model.OrderUserDetail;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "SingleUserDetail")
public class SingleUserDetail extends HttpServlet {
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
            RequestDispatcher rd = request.getRequestDispatcher("single_user_detail.jsp");
            rd.include(request, response);
        }




    }
}
