package com.example.ticketbookingsystem;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "frontDeskCheckoutServlet", value = "/frontDeskCheckoutServlet")
public class frontDeskCheckoutServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if(session.getAttribute("userID") == null){
            session.setAttribute("error", "login timeout");
            response.sendRedirect("./index.jsp");
            return;
        }
        if(session.getAttribute("logRole") != "frontdesk"){
            session.setAttribute("error", "Unauthorized Page");
            response.sendRedirect("./index.jsp");
            return;
        }
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
        TicketStruct ticket = new TicketStruct();
        ticket.TMDBid = Integer.parseInt(request.getParameter("TMDBid"));
        ticket.name = String.join(" ", request.getParameter("fname"), request.getParameter("lname"));
        ticket.email = request.getParameter("email");
        ticket.phone = request.getParameter("phone");
        ticket.price = Double.parseDouble(request.getParameter("total"));
        ticket.seats = new ArrayList<>();
        for (String seat : request.getParameter("seats").split(",")){
            ticket.seats.add(seat);
        }
        ticket.showdate = request.getParameter("moviedate");
        ticket.showtime = request.getParameter("movietime");
        Ticket ticketObj = new Ticket();
        List<String> seatsBooked = ticketObj.getBookedSeats(ticket.TMDBid, ticket.showtime, ticket.showdate);
        for(String seat : seatsBooked) {
            for(String selectedSeat : ticket.seats){
                if(selectedSeat == seat){
                    request.setAttribute("errorMessage", "Seat Already Booked");
                    ticketObj.close();
                    response.sendRedirect("error.jsp");
                    return;
                }
            }
        }
        ticket.transactionId = "FrontDeskPayment";
        ticketObj.insertTicket(ticket);
        ticketObj.close();
    }
}
