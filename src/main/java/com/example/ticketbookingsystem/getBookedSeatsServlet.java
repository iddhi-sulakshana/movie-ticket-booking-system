package com.example.ticketbookingsystem;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "getBookedSeatsServlet", value = "/getBookedSeatsServlet")
public class getBookedSeatsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        int movieId = Integer.parseInt(request.getParameter("movieId"));
        String showdate = request.getParameter("showDate");
        showdate = String.join("-", showdate.split("/"));
        showdate = String.format("%s-%s-%s", showdate.split("-")[2], showdate.split("-")[0], showdate.split("-")[1]);
        String showtime = request.getParameter("showTime");
        System.out.println(movieId);
        System.out.println(showdate);
        System.out.println(showtime);
        Ticket ticket = new Ticket();
        List<String> seats = ticket.getBookedSeats(movieId, showtime, showdate);
        ticket.close();
        List<String> message = new ArrayList<>();
        for(String seat : seats) {
            message.add(String.format("\"%s\"", seat));
        }
        Gson gson = new Gson();
        response.getWriter().write(message.toString());
    }
}
