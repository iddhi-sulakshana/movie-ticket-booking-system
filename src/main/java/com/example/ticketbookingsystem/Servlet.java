package com.example.ticketbookingsystem;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

@WebServlet(name = "Servlet", value = "/Servlet")
public class Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Movie movie = new Movie();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        //dateFormat.setTimeZone();
        List<Date> dates = movie.getDates("16:00");
        for (Date date: dates) {
            dateFormat.format(date);
        }

    }

}
