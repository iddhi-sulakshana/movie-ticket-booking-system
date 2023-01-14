package com.example.ticketbookingsystem;

import com.paypal.api.payments.*;
import com.paypal.base.rest.PayPalRESTException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.nio.file.FileStore;

@WebServlet(name = "execute_payment", value = "/execute_payment")
public class ExecutePaymentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");

        HttpSession session = request.getSession();
        OrderDetails orderDetail = (OrderDetails) session.getAttribute("order");

        String amountPaid = null;
        String paymentTime = null;
        String customerPhone = orderDetail.getCustomerPhoneNumber();
        try {
            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.executePayment(paymentId, payerId);

            paymentTime = payment.getCreateTime();


            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            System.out.println("Payer INFORMATION in EXEXECUTE:" + payerInfo);
            String firstName = payerInfo.getFirstName();
            String payerID = payerInfo.getPayerId();
            System.out.println("First Name: " + firstName);
            System.out.println("Payer ID: " + payerID);
            System.out.println("Payment ID" + paymentId);
            Transaction transaction = payment.getTransactions().get(0);


            Amount amount = transaction.getAmount();
            amountPaid = amount.getTotal();

            System.out.println("Transaction INFORMATION in EXEXECUTE:" + transaction);

            request.setAttribute("payer", payerInfo);
            request.setAttribute("transaction", transaction);
            request.setAttribute("paymentID", paymentId);

            request.getRequestDispatcher("receipt.jsp").forward(request, response);

            session.invalidate();

        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }

        TwillioAPI twillio = new TwillioAPI();
        String body = "Payment to ABC Movies was completed at" + paymentTime + ".Transaction ID:" + paymentId + "Paid Amount: " + amountPaid;
//        twillio.sendSMS("<customerPhone variable>", body); //The number that's working here is my number.


    }


}
