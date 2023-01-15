package com.example.ticketbookingsystem;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "deleteMovieServlet", value = "/deleteMovieServlet")
public class deleteMovieServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("userID") == null){
            session.setAttribute("error", "Log in timeout");
            response.sendRedirect("./index.jsp");
            return;
        }
        if (session.getAttribute("logRole") != "admin") {
            session.setAttribute("error", "Unauthorized page");
            response.sendRedirect("index.jsp");
            return;
        }
        int id = Integer.parseInt(request.getParameter("movieId"));
        Movie movieObj = new Movie();
        movieObj.deleteMovie(id);
        session.setAttribute("error", "Movie deleted successful");
        response.sendRedirect("./mDashboard.jsp");
    }
}
