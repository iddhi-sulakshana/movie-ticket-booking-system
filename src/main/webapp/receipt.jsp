<%--
  Created by IntelliJ IDEA.
  User: Chamo
  Date: 1/13/2023
  Time: 11:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="./fontawesome/css/all.css">
    <link href="./css/receipt.css" rel="stylesheet">
</head>
<body>

<div class="container" style="margin-top: 200px;">
    <div class="row align-items-center mb-5">
        <div class="col-lg-12 d-flex justify-content-center">
            <img class="img-logo" src="./assets/primary-images/icon.png">
        </div>
        <div class="col-lg-12 d-flex justify-content-center mt-4">
            <h1>Thank you for your payment.</h1>
        </div>
        <div class="col-lg-12 d-flex justify-content-center mt-4 mb-4">

            <span class="text-muted me-2">Payment ID:</span>
            <span class="text-muted ms-1">${paymentID}</span>
        </div>

        <div class="col-lg-12 d-flex justify-content-center">

            <a class="btn btn-primary" href="index.jsp" role="button">Home</a>
        </div>

    </div>

</div>


</body>
</html>
