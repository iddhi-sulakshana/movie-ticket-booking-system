package com.example.ticketbookingsystem;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "insertMovieServlet", value = "/insertMovieServlet")
public class insertMovieServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("userID") == null){
            session.setAttribute("error", "Log in timeout");
            response.sendRedirect("./index.jsp");
            return;
        }
        if(request.getParameter("moviename") == null ||
            request.getParameter("timeslot") == null ||
            request.getParameter("showdates") == null ||
            request.getParameter("price") == null)
        {
            session.setAttribute("error", "Null values");
            response.sendRedirect("./mDashboard.jsp");
            return;
        }
        tmdbAPI api = new tmdbAPI();
        int id = api.searchMovie(request.getParameter("moviename"));
        if(id == -1) {
            session.setAttribute("error", "Movie not found");
            response.sendRedirect("./mDashboard.jsp");
            return;
        }
        Movie movie = new Movie();
        List<String> showdates = new ArrayList<>();
        for (String date : request.getParameter("showdates").split(", ")){
            showdates.add(String.join("-", date.split("/")));
        }

        int success = movie.insertMovie(id, showdates, request.getParameter("timeslot"), Double.parseDouble(request.getParameter("price")));
        movie.close();
        if(success == 1) {
            session.setAttribute("error", "Movie already Exist");
        }
        response.sendRedirect("./mDashboard.jsp");
    }
}
