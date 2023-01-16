<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Chamo
  Date: 1/13/2023
  Time: 11:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ABC Cinemas</title>
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="./fontawesome/css/all.css">
    <link href="./css/review.css" rel="stylesheet">
</head>
<body>
<div>

    <div class="container mt-4">


        <form action="execute_payment" method="post">
            <input type="hidden" name="paymentId" value="${param.paymentId}"/>
            <input type="hidden" name="PayerID" value="${param.PayerID}" />

            <div class="row justify-content-center">
                <div class="col-lg-5 mt-5 ms-5 me-5 mb-3 p-4 order-summary">
                    <div class="row">
                        <div class="col">
                            <h2 class="mt-4">ORDER SUMMARY</h2>
                        </div>
                    </div>

                    <div class="row mt-4 d-flex justify-content-between" >
                        <div class="col">
                            <h4>Client Details</h4>
                            <h6 class="text-muted movie-name">${order.customerFirstName} ${order.customerLastName}</h6>
                            <span class="text-muted movie-type">${order.customerEmail}</span><br>
                        </div>
                    </div>


                    <div class="row mt-4 d-flex justify-content-between">
                        <div class="col">
                            <h4>Booking Details</h4>
                            <h6 class="text-muted">${order.movieName}</h6>
                            <span class="text-muted movie-theater-">ABC Cinema: LUXE HALL</span>
                            <div class="mt-4">
                                <h6 class="text-muted movie-screen-seats">${seats} - ${order.totalSeats} Ticket(s)</h6>

                                <h6 class="text-muted movie-date">${order.movieDate}</h6>
                                <h6 class="text-muted movie-date">${order.movieTime}</h6>
                            </div>
                        </div>

                    </div>
                    <hr>
                    <div class="row mb-4">
                        <div class="col-lg-6">
                            <h6 class="text-muted">Amount Payable</h6>
                        </div>
                        <div class="col-lg-6 d-flex justify-content-end">
                            <span class="amount currency me-2">USD</span>
                            <span class="amount price">${order.total}</span>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-lg btn-warning"><i class="fab fa-paypal me-2"></i>Pay Now</button><br>

                </div>


            </div>
        </form>

        <div class="row">
            <div class="col-12 d-flex justify-content-center">
                <a class="btn btn-primary" href="index.jsp?invalidate=true" role="button">Cancel Order</a>
            </div>
        </div>

    </div>


</body>
</html>




<%--<div></div>--%>
<%--<h1>Please Review Before Paying</h1>--%>
<%--<form action="execute_payment" method="post">--%>
<%--    <p>Customer Name: ${order.customerFirstName} ${order.customerLastName}</p>--%>
<%--    <table>--%>
<%--        <tr>--%>
<%--            <td colspan="2"><b>Transaction Details:</b></td>--%>
<%--            <td>--%>
<%--                <input type="hidden" name="paymentId" value="${param.paymentId}" />--%>
<%--                <input type="hidden" name="PayerID" value="${param.PayerID}" />--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>Description:</td>--%>
<%--            <td>${transaction.description}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>Subtotal:</td>--%>
<%--            <td>${transaction.amount.details.subtotal} USD</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>Shipping:</td>--%>
<%--            <td>${transaction.amount.details.shipping} USD</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>Tax:</td>--%>
<%--            <td>${transaction.amount.details.tax} USD</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>Total:</td>--%>
<%--            <td>${transaction.amount.total} USD</td>--%>
<%--        </tr>--%>
<%--        <tr><td><br/></td></tr>--%>
<%--        <tr>--%>
<%--            <td colspan="2"><b>Payer Information:</b></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>First Name:</td>--%>
<%--            <td>${payer.firstName}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>Last Name:</td>--%>
<%--            <td>${payer.lastName}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>Email:</td>--%>
<%--            <td>${payer.email}</td>--%>
<%--        </tr>--%>
<%--        <tr><td><br/></td></tr>--%>
<%--        <tr>--%>
<%--            <td colspan="2"><b>Shipping Address:</b></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>Recipient Name:</td>--%>
<%--            <td>${shippingAddress.recipientName}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>Line 1:</td>--%>
<%--            <td>${shippingAddress.line1}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>City:</td>--%>
<%--            <td>${shippingAddress.city}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>State:</td>--%>
<%--            <td>${shippingAddress.state}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>Country Code:</td>--%>
<%--            <td>${shippingAddress.countryCode}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>Postal Code:</td>--%>
<%--            <td>${shippingAddress.postalCode}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td colspan="2" align="center">--%>
<%--                <input type="submit" value="Pay Now" />--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--</form>--%>
<%--</div>--%>
