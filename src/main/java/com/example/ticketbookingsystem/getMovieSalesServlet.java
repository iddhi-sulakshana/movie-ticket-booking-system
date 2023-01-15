package com.example.ticketbookingsystem;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "getMovieSalesServlet", value = "/getMovieSalesServlet")
public class getMovieSalesServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("userID") == null){
            session.setAttribute("error", "Log in timeout");
            response.sendRedirect("./index.jsp");
            return;
        }
        String role = (String) session.getAttribute("logRole");
        if (role != "admin") {
            session.setAttribute("error", "Unauthorized page");
            response.sendRedirect("index.jsp");
            return;
        }
        if(session.getAttribute("movieId") == null){
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            if(request.getParameter("movieId") == null){
                response.getWriter().write("-1");
                return;
            }
            int id = Integer.parseInt(request.getParameter("movieId"));
            Ticket ticket = new Ticket();
            double sales = ticket.getMovieSales(id);
            ticket.close();
            Gson gson = new Gson();
            response.getWriter().write(gson.toJson(String.format("%.2f", sales)));
        }
        try {

        } catch (Exception ex){
                throw new RuntimeException(ex);
        }
    }
}
