package com.example.ticketbookingsystem;

import com.example.ticketbookingsystem.User;
import com.example.ticketbookingsystem.UserStruct;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.bson.types.ObjectId;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

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
        String password = request.getParameter("password");
        if(user == null){
            userObj.close();
            response.sendRedirect("./login.jsp");
            return;
        }
        try {
            password = new Encryption().encrypt(password);
        } catch (NoSuchAlgorithmException e) {
            response.sendRedirect("./login.jsp");
            return;
        }
        if(fullname != user.fullName && fullname != null)
            user.fullName = fullname;

        if(password != user.password && password != null)
            user.password = password;
        userObj.updateUser(user);
        userObj.close();
        if(session.getAttribute("logRole") == "admin"){
            response.sendRedirect("./mDashboard.jsp");
            return;
        }
        response.sendRedirect("./uDashboard.jsp");
    }
}
