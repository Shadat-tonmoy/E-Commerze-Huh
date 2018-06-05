package com.shadat.admin.controller;

import com.shadat.database.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

@WebServlet(name = "AddImageProductToDB")
public class AddImageProductToDB extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        String productId = request.getParameter("productId");
        ArrayList<String> productImages = new ArrayList<>();

        // Let's obtains parameters name here!
        Enumeration enumeration = request.getParameterNames();
        while (enumeration.hasMoreElements()) {
            String parameterName = (String) enumeration.nextElement();
            if(parameterName.startsWith("veneerSheetImage"))
            {
//                pw.println("Image = " + request.getParameter(parameterName));
                productImages.add(request.getParameter(parameterName));
            }

        }
        Database database = new Database();
        database.addImagesToProduct(productId,productImages);
        database.addThumbnailToProduct(productId,productImages.get(0));
        response.sendRedirect("/admin/");


    }
}
