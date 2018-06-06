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

@WebServlet(name = "DeleteVeneerSheetFromDB")
public class DeleteVeneerSheetFromDB extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String deleteId = request.getParameter("delete");
        Database database = new Database();
        boolean result = database.deleteProductFromDB(deleteId);
        if(result)
        {
            RequestDispatcher rd = request.getRequestDispatcher("veneer-sheet");
            //rd.forward(request, response);
            HttpSession session = request.getSession(false);
            session.setAttribute("deletedVeneerSheet", true);
            response.sendRedirect("veneer-sheet");
        }

    }
}
