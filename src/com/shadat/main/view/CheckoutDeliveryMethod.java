package com.shadat.main.view;

import com.shadat.main.model.OrderUserDetail;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "CheckoutDeliveryMethod")
public class CheckoutDeliveryMethod extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("firstName") !=null && request.getParameter("lastName")!=null &&
        request.getParameter("detailAddress") != null && request.getParameter("phone")!=null &&
                request.getParameter("email")!=null)
        {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String address = request.getParameter("detailAddress");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            OrderUserDetail orderUserDetail = new OrderUserDetail(firstName,lastName,phone,email,address);
            System.out.println(orderUserDetail.toString());
            HttpSession session = request.getSession(false);
            session.setAttribute("userDetail", orderUserDetail);
        }
        RequestDispatcher rd = request.getRequestDispatcher("/static/checkoutDeliveryMethod.jsp");
        rd.include(request, response);


    }
}
