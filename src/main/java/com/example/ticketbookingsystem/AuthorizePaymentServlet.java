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

        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String userPhoneNumber = request.getParameter("userphone");
        String total =request.getParameter("total");
        String movieName = request.getParameter("movieName");
        String totalTickets = request.getParameter("tickets");

        OrderDetails orderDetails = new OrderDetails(firstName, lastName, email, userPhoneNumber, movieName, totalTickets, total);

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
