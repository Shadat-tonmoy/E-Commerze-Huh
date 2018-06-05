package com.shadat.admin.controller;

import com.oreilly.servlet.MultipartRequest;
import com.shadat.admin.model.Product;
import com.shadat.database.Database;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddVeneerSheetToDB")
@MultipartConfig
public class AddVeneerSheetToDB extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String title = request.getParameter("title");
        double price = Double.parseDouble(request.getParameter("price"));
        String available = request.getParameter("available");
        double discount = Double.parseDouble(request.getParameter("discount"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        String description = request.getParameter("description");
        String fname = request.getParameter("fname");
        boolean isAvailable = available.equals("on")?true:false;

        Product product = new Product(title,description,fname,price,discount,isAvailable,stock);
        System.out.println(" " +title+" "+price+" "+isAvailable+" "+discount+" "+description+" "+fname);
        Database database = new Database();
        database.createConnection();
        boolean isAdded = database.addProduct(product);
        if(isAdded)
        {
            System.out.println("Added");
            RequestDispatcher rd = request.getRequestDispatcher("admin/veneer-sheet");
            //rd.forward(request, response);
            HttpSession session = request.getSession(false);
            session.setAttribute("newProduct",true);
            session.setAttribute("productTitle",title);
            response.sendRedirect("admin/veneer-sheet");
        }
        else
        {

        }

//        response.setContentType("text/html");
//        PrintWriter out = response.getWriter();
//        String relativeWebPath = "/uploads/";
//        String uploadDir = request.getSession().getServletContext().getRealPath(relativeWebPath);
//        uploadDir = uploadDir.replaceAll("out/artifacts/volume360_war_exploded/","");
//        File file = new File(uploadDir);



//        System.out.println("UploadDir "+uploadDir+" Files "+request.getParameter("fname"));
//        MultipartRequest multipartRequest  =new MultipartRequest(request,uploadDir);
//        out.print("successfully uploaded");

    }
}
