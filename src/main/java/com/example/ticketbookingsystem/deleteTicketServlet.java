package com.example.ticketbookingsystem;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "deleteTicketServlet", value = "/deleteTicketServlet")
public class deleteTicketServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(request.getParameter("ticketId") == null || request.getParameter("transactionId") == null ||
                request.getParameter("uemail") == null
        ){
            session.setAttribute("error", "Invalid Request");
            response.sendRedirect("./uDashboard.jsp");
            return;
        }
        if(session.getAttribute("userID") == null){
            session.setAttribute("error", "Log in timeout");
            response.sendRedirect("./index.jsp");
            return;
        }
        if (session.getAttribute("logRole") == "admin") {
            session.setAttribute("error", "Unauthorized Page");
            response.sendRedirect("index.jsp");
            return;
        }
        Ticket ticket = new Ticket();
        ticket.deleteTicket(Integer.parseInt(request.getParameter("ticketId")), request.getParameter("uemail"), request.getParameter("transactionId").toString());
        ticket.close();
        response.sendRedirect("uDashboard.jsp");
    }
}
