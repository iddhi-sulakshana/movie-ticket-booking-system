package com.example.ticketbookingsystem;

import com.paypal.api.payments.*;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

import java.util.ArrayList;
import java.util.List;

public class PaymentServices {

    private static final String CLIENT_ID = "AY5FDTCDzcNTd5_MXqWWeGsU3wJaEK0PzY3CPYXrjYi9heoM_TRkK6qxp9L-SblNyd7-dgr2k2mVTUs1";
    private static final String CLIENT_SECRET = "EHtMezhiXdY0dqggAsnHfSVotRVAcG7Vt-eNKVZvbM4LVYQeMk4ANO3nHTOaMIQJCUAaM0t4X---xqxb";
    private static final String MODE = "sandbox";


    public String authorizePayment(OrderDetails orderDetails)
            throws PayPalRESTException {

        Payer payer = getPayerInformation(orderDetails);
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTransaction = getTransactionInformation(orderDetails);

        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction);
        requestPayment.setRedirectUrls(redirectUrls);
        requestPayment.setPayer(payer);
        requestPayment.setIntent("sale");

        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        Payment approvedPayment = requestPayment.create(apiContext);

        return getApprovalLink(approvedPayment);

    }

    private Payer getPayerInformation(OrderDetails orderDetails) {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");

        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setFirstName(orderDetails.getCustomerFirstName())
                .setLastName(orderDetails.getCustomerLastName())
                .setEmail(orderDetails.getCustomerEmail());
        payer.setPayerInfo(payerInfo);

        return payer;
    }

    private RedirectUrls getRedirectURLs() {
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8080/TicketBookingSystem_war_exploded/cancel.jsp");
        redirectUrls.setReturnUrl("http://localhost:8080/TicketBookingSystem_war_exploded/review_payment");

        return redirectUrls;
    }

    private List<Transaction> getTransactionInformation(OrderDetails orderDetails) {

        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setTotal(orderDetails.getTotal());

        Transaction transaction = new Transaction();
        transaction.setAmount(amount);
        transaction.setDescription(orderDetails.getMovieName());

        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<>();

        double pricePerTicket = Double.parseDouble(orderDetails.getTotal()) / Double.parseDouble(orderDetails.getTotalSeats());
        String price = Double.toString(pricePerTicket);

        Item item = new Item();
        item.setCurrency("USD");
        item.setName(orderDetails.getMovieName());
        item.setPrice(price);
        item.setQuantity(orderDetails.getTotalSeats());


        items.add(item);
        itemList.setItems(items);
        transaction.setItemList(itemList);

        List<Transaction> listTransaction = new ArrayList<>();
        listTransaction.add(transaction);

        return listTransaction;
    }

    private String getApprovalLink(Payment approvedPayment) {
        List<Links> links = approvedPayment.getLinks();
        String approvalLink = null;

        for (Links link : links) {
            if (link.getRel().equalsIgnoreCase("approval_url")) {
                approvalLink = link.getHref();
                break;
            }
        }

        return approvalLink;
    }

    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        return Payment.get(apiContext, paymentId);
    }

    public Payment executePayment(String paymentId, String payerId)
            throws PayPalRESTException {
        PaymentExecution paymentExecution = new PaymentExecution();
        paymentExecution.setPayerId(payerId);

        Payment payment = new Payment().setId(paymentId);

        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        return payment.execute(apiContext, paymentExecution);
    }




}
