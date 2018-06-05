package com.shadat.admin.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "Logout-Admin")
public class LogoutAdmin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("HelloWorld");
        HttpSession session = request.getSession(false);
        if(session.getAttribute("admin")!=null)
        {
            session.removeAttribute("admin");
            session.invalidate();
            response.sendRedirect("/admin/");
        }
    }
}
