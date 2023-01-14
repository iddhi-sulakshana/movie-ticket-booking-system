package com.example.ticketbookingsystem;

import com.paypal.base.rest.PayPalRESTException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "authorize_payment", value = "/authorize_payment")
public class AuthorizePaymentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String movieID = request.getParameter("TMDBid");
        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String email = request.getParameter("email");
        String userPhoneNumber = request.getParameter("phone");
        String total = "8";
//       String total = request.getParameter("total");
        String movieName = request.getParameter("title");
        String totalSeats = "1"; // Edit total seats count into here
        String seats = request.getParameter("seats");
        String movieDate = request.getParameter("moviedate");
        String movieTime = request.getParameter("movietime");

        OrderDetails orderDetails = new OrderDetails(firstName, lastName, email, userPhoneNumber, movieName, totalSeats,
                seats, total, movieID, movieTime, movieDate);

        HttpSession session = request.getSession();
        session.setAttribute("order", orderDetails);

        try {
            PaymentServices paymentServices = new PaymentServices();
            String approvalLink = paymentServices.authorizePayment(orderDetails);

            response.sendRedirect(approvalLink);
            System.out.println("Approval LINK: " + approvalLink);



        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }

    }
}
