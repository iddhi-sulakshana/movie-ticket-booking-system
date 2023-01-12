package com.example.ticketbookingsystem;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;


@WebServlet(name = "Servlet", value = "/Servlet")
public class Servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        String moviename = request.getParameter("moviename");
        tmdbAPI api = new tmdbAPI();
        int id = api.searchMovie(moviename);
        if(id == -1) {
            response.getWriter().write("-1");
            return;
        }
        String data = "";
        Gson gson = new Gson();
        response.getWriter().write(gson.toJson(api.getMovie(id)));
    }

}
