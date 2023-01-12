package com.example.ticketbookingsystem;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.bson.types.ObjectId;

import java.io.IOException;

@WebServlet(name = "updateUserServlet", value = "/updateUserServlet")
public class updateUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if(session.getAttribute("userID") == null){
            response.sendRedirect("./index.jsp");
            return;
        }
        ObjectId userId = (ObjectId) session.getAttribute("userID");
        User userObj = new User();
        UserStruct user = userObj.getUser(userId);
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        if(user == null){
            response.sendRedirect("./login.jsp");
            return;
        }
        if(fullname != user.fullName && fullname != null)
            user.fullName = fullname;
        if(email != user.email && email != null)
            user.email = email;
        if(phone != user.phone && phone != null)
            user.phone = phone;
        if(password != user.password && password != null)
            user.password = password;
        userObj.updateUser(user);
        response.sendRedirect("./login.jsp");
    }
}
