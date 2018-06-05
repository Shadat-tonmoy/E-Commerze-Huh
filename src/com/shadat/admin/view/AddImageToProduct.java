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
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddImageToProduct")
public class AddImageToProduct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("/admin/");
        } else {
            String productId = request.getParameter("addimage");
            Database database = new Database();

            String relativeWebPath = "/img/veneer-sheets/";
            String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
            System.out.println(absoluteDiskPath);

            String path = "/web/img/veneer-sheets/";
            File folder = new File(absoluteDiskPath);
            File[] listOfFiles = folder.listFiles();
            System.out.println(getServletContext());
            List<String> imageFiles = new ArrayList<>();
            for (File file : listOfFiles) {
                if (file.isFile()) {
                    String fileName = file.getName();//.replace(" ", "%20");
//                    System.out.println(fileName);
                    imageFiles.add(fileName);
                }
            }
            request.setAttribute("imageFiles",imageFiles);
            request.setAttribute("productId",productId);
            RequestDispatcher rd = request.getRequestDispatcher("add_image_to_product_view.jsp");
            rd.include(request, response);
        }
    }
}
