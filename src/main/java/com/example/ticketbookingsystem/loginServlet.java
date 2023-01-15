package com.example.ticketbookingsystem;

import com.example.ticketbookingsystem.User;
import com.example.ticketbookingsystem.UserStruct;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;

@WebServlet(name = "loginServlet", value = "/loginServlet")
public class loginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if(request.getParameter("email") == null || request.getParameter("password") == null){
            session.setAttribute("error", "Bad request");
            response.sendRedirect("./");
        }
        User objUser = new User();
        String inEmail = request.getParameter("email");
        String inPassword = request.getParameter("password");
        UserStruct user = objUser.getUser(inEmail);
        try {
            inPassword = new Encryption().encrypt(inPassword);
        } catch (NoSuchAlgorithmException e) {
            response.sendRedirect("./login.jsp");
            return;
        }
        //check email
        if (user != null) {
            //check password
            if (user.password.equals(inPassword)) {
                switch (user.role) {
                    case "admin":
                        //admin account
                        session.setAttribute("logRole", "admin");
                        response.sendRedirect("mDashboard.jsp");
                        break;
                    case "frontdesk":
                        //frontdest account
                        session.setAttribute("logRole", "frontdesk");
                        response.sendRedirect("uDashboard.jsp");
                        break;
                    default:
                        //user account
                        session.setAttribute("logRole", "user");
                        response.sendRedirect("uDashboard.jsp");
                        break;
                }
                session.setAttribute("userID", user._id);
            } else {
                objUser.close();
                session.setAttribute("loginPasswordError", " ! Invalid Password");
                response.sendRedirect("login.jsp");
            }
        }
        else {
            objUser.close();
            session.setAttribute("loginEmailError", " ! Invalid email address");
            response.sendRedirect("login.jsp");
        }
        objUser.close();

    }
}
