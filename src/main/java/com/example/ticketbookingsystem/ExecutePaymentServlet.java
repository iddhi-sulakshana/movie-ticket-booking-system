package com.example.ticketbookingsystem;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "execute_payment", value = "/execute_payment")
public class ExecutePaymentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");

//        String paymentId = (String) request.getAttribute("paymentId");
//        String payerId = (String) request.getAttribute("payerId");

        System.out.println("Execute payment servlet");
//
//        System.out.println("PaymentID doPOST(): " + paymentId);
//        System.out.println("Payer ID doPOST(): " + payerId);
        try {
            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.executePayment(paymentId, payerId);

//            System.out.println("Payment Details in Execute Payment: " + payment);
            //duplicate
//            PaymentServices paymentServices = new PaymentServices();
//            Payment payment = paymentServices.getPaymentDetails(paymentId);
            //duplicate end
//
            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            System.out.println("Payer INFORMATION in EXEXECUTE:" + payerInfo);
            String firstName = payerInfo.getFirstName();
            String payerID = payerInfo.getPayerId();
            System.out.println("First Name: " + firstName);
            System.out.println("Payer ID: " + payerID);
            System.out.println("Payment ID" + paymentId);
            Transaction transaction = payment.getTransactions().get(0);;
//            String paymentTime = transaction.getTransactions();
//            Transaction transaction = payment.getTransactions();
            System.out.println("Transaction INFORMATION in EXEXECUTE:" + transaction);
//
            request.setAttribute("payer", payerInfo);
            request.setAttribute("transaction", transaction);
            request.setAttribute("paymentID", paymentId);
//
            request.getRequestDispatcher("reciept.jsp").forward(request, response);
//
        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }

        String msgBody = "A payment of";

//        Twillio twillio = new Twillio();
////        String body = "Test message: payment done";
//////        twillio.sendSMS();
////        twillio.sendSMS("+94775615718", body);


    }


}
