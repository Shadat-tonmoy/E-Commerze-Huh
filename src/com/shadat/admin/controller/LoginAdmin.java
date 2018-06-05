package com.shadat.admin.controller;

import com.shadat.database.Database;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginAdmin")
public class LoginAdmin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        if(userName!=null && userName.length()>0 && password!=null && password.length()>0)
        {
            Database database = new Database();
            int adminId = database.getAdminToLogin(userName,password);
            System.out.println("AdminId "+adminId);
            if(adminId>0)
            {
                HttpSession session = request.getSession(true);
                if(session.getAttribute("admin")==null)
                {
                    session.setAttribute("admin",adminId);
                    response.sendRedirect("/admin/");
                }
            }
            else
            {
                response.sendRedirect("/admin/");

            }

        }
        else
        {
            System.out.println("NULL NU:: NULLL");
            response.sendRedirect("/admin/");
        }

    }
}
