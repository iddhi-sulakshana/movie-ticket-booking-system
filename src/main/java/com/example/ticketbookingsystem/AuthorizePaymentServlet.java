package com.example.ticketbookingsystem;

import com.paypal.base.rest.PayPalRESTException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "authorize_payment", value = "/authorize_payment")
public class AuthorizePaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(request.getParameter("TMDBid") == null || request.getParameter("fname") == null ||
                request.getParameter("lname") == null || request.getParameter("email") == null ||
                request.getParameter("phone") == null || request.getParameter("total") == null ||
                request.getParameter("title") == null || request.getParameter("totalSeats") == null ||
                request.getParameter("seats") == null || request.getParameter("moviedate") == null ||
                request.getParameter("movietime") == null)
        {
            session.setAttribute("error", "Invalid request");
            response.sendRedirect("./");
            return;
        }

        String movieID = request.getParameter("TMDBid");
        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String email = request.getParameter("email");
        String userPhoneNumber = request.getParameter("phone");
        String total = request.getParameter("total");
        String movieName = request.getParameter("title");
        String totalSeats = request.getParameter("totalSeats");
        List<String> seats = new ArrayList<>();
        for (String seat : request.getParameter("seats").split(",")){
            seats.add(seat);
        }
        String movieDate = request.getParameter("moviedate");
        String movieTime = request.getParameter("movietime");

        OrderDetails orderDetails = new OrderDetails(firstName, lastName, email, userPhoneNumber, movieName, totalSeats,
                seats, total, movieID, movieTime, movieDate);

        session.setAttribute("order", orderDetails);

        try {
            PaymentServices paymentServices = new PaymentServices();
            String approvalLink = paymentServices.authorizePayment(orderDetails);

            response.sendRedirect(approvalLink);



        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }

    }
}
