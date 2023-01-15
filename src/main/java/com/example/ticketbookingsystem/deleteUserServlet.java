package com.example.ticketbookingsystem;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.bson.types.ObjectId;

import java.io.IOException;

@WebServlet(name = "deleteUserServlet", value = "/deleteUserServlet")
public class deleteUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("userID") == null){
            response.sendRedirect("./index.jsp");
            return;
        }
        ObjectId userId = (ObjectId) session.getAttribute("userID");
        String role = (String) session.getAttribute("logRole");
        if (role != "user") {
            response.sendRedirect("index.jsp");
            return;
        }
        User userObj = new User();
        userObj.deleteUser(userId);
        userObj.close();
    }
}
