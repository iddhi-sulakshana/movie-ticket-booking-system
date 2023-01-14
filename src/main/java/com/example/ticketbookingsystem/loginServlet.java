package com.example.ticketbookingsystem;

import com.example.ticketbookingsystem.User;
import com.example.ticketbookingsystem.UserStruct;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "loginServlet", value = "/loginServlet")
public class loginServlet extends HttpServlet {

    User objUser = new User();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String inEmail = request.getParameter("email");
        String inPassword = request.getParameter("password");
        UserStruct user = objUser.getUser(inEmail);

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
