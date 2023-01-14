package com.example.ticketbookingsystem;

import com.example.ticketbookingsystem.User;
import com.example.ticketbookingsystem.UserStruct;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.bson.types.ObjectId;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "signupServlet", value = "/signupServlet")
public class signupServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if(request.getParameter("fullname") == null ||
            request.getParameter("email") == null ||
            request.getParameter("phone") == null ||
            request.getParameter("password") == null)
        {
            response.sendRedirect("login.jsp");
            return;
        }
        UserStruct user = new UserStruct();
        user.fullName = (String) request.getParameter("fullname");
        user.email = (String) request.getParameter("email");
        user.phone = (String) request.getParameter("phone").trim();
        user.password = (String) request.getParameter("password");
        user.role = "user";
        User userObj = new User();
        if(userObj.isExistEmail(user.email) == 1){
            response.sendRedirect("./login.jsp");
            return;
        }
        if(userObj.isExistPhone(user.phone) == 1){
            response.sendRedirect("./login.jsp");
            return;
        }
        userObj.createUser(user);
        userObj.close();
        response.sendRedirect("./login.jsp");
    }
}
