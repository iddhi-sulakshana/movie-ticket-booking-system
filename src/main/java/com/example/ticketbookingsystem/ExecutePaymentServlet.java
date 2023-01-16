package com.example.ticketbookingsystem;

import com.paypal.api.payments.*;
import com.paypal.base.rest.PayPalRESTException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.nio.file.FileStore;
import java.util.List;

@WebServlet(name = "execute_payment", value = "/execute_payment")
public class ExecutePaymentServlet extends HttpServlet {



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(request.getParameter("paymentId") == null || request.getParameter("PayerID") == null ||
                session.getAttribute("order") == null){
            session.setAttribute("error", "Invalid request / bad request");
            response.sendRedirect("./checkout.jsp");
            return;
        }
        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");

        OrderDetails orderDetail = (OrderDetails) session.getAttribute("order");

        String amountPaid = null;
        String paymentTime = null;
        String customerPhone = orderDetail.getCustomerPhoneNumber();
        TicketStruct ticket = new TicketStruct();
        ticket.TMDBid = Integer.parseInt(orderDetail.getMovieID());
        ticket.phone = orderDetail.getCustomerPhoneNumber();
        ticket.email = orderDetail.getCustomerEmail();
        ticket.name = String.join(" ", orderDetail.getCustomerFirstName(), orderDetail.getCustomerLastName());
        ticket.seats = orderDetail.getSeats();
        ticket.showtime = orderDetail.getMovieTime();
        ticket.showdate = orderDetail.getMovieDate();
        ticket.price = Double.parseDouble(orderDetail.getTotal());
        Ticket ticketObj = new Ticket();
        List<String> seatsBooked = ticketObj.getBookedSeats(ticket.TMDBid, ticket.showtime, ticket.showdate);
        if(seatsBooked != null){
            for(String seat : seatsBooked) {
                for(String selectedSeat : ticket.seats){
                    if(selectedSeat == seat){
                        request.setAttribute("errorMessage", "Seat Already Booked");
                        ticketObj.close();
                        response.sendRedirect("error.jsp");
                        return;
                    }
                }
            }
        }

        try {
            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.executePayment(paymentId, payerId);

            paymentTime = payment.getCreateTime();

            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);


            Amount amount = transaction.getAmount();
            amountPaid = amount.getTotal();


            request.setAttribute("payer", payerInfo);
            request.setAttribute("transaction", transaction);
            request.setAttribute("paymentID", paymentId);
            ticket.transactionId = paymentId;
            ticketObj.insertTicket(ticket);
            ticketObj.close();
            request.getRequestDispatcher("receipt.jsp").forward(request, response);

            session.removeAttribute("order");

        } catch (PayPalRESTException ex) {
            ticketObj.close();
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }


        TwillioAPI twillio = new TwillioAPI();
        String seats = "";
        String body = "Payment to ABC Movies was completed at " + paymentTime + ". Transaction ID: " + paymentId + ", Paid Amount: $" + amountPaid + ", Seat Numbers : " + ticket.seats;
        //uncomment below code to send sms
        //twillio.sendSMS("+94"+customerPhone, body); //phone number must be registerd in twillio


        ticketObj.close();
    }


}
