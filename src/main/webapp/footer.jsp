<%--    <%@include file="./displayError.jsp"%>--%>
<div class="footerCover">
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <h4>Contact Us</h4><hr>
                    <div class="row">
                        <div class="col-6">
                            <ul class="list-unstyled">
                                <li style="display: flex;"><i class="fa fa-phone" aria-hidden="true"></i><p style="font-size: 13px;">&ensp;011-2254789 / 0714578962</p></li>
                                <li style="display: flex;"><i class="fa fa-address-card" aria-hidden="true"></i><p style="font-size: 13px;">&ensp;High Level Rd, Kottwa</p></li>
                            </ul>
                        </div>
                    </div>
                    <section class="mb-4">
                        <!-- Facebook -->
                        <a class="btn btn-outline-light btn-floating m-1 rounded" style="background-color: #3b5998;" href="https://www.facebook.com" role="button"
                        ><i class="fab fa-facebook-f"></i
                        ></a>

                        <!-- Twitter -->
                        <a class="btn btn-outline-light btn-floating m-1" style="background-color: #55acee;" href="https://twitter.com" role="button"
                        ><i class="fab fa-twitter"></i
                        ></a>

                        <!-- Instagram -->
                        <a class="btn btn-outline-light btn-floating m-1" style="background-color: #ac2bac;" href="https://www.instagram.com" role="button"
                        ><i class="fab fa-instagram"></i
                        ></a>

                    </section>
                    <br>
                </div>
                <div class="col-md-7">
                    <h4 class="text-md-right">Give us Feedback</h4>
                    <hr>

                    <form method="post" action="">
                        <fieldset class="form-group">
                            <input name="email" type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email" required>
                        </fieldset>
                        <br>
                        <fieldset class="form-group">
                            <textarea name="feedback" class="form-control" id="exampleMessage" placeholder="Your Feedback" required></textarea>
                        </fieldset>
                        <br>
                        <fieldset class="form-group text-xs-right">
                            <input style="color: #adff2f; border: none; background-color: transparent;" type="submit" value="Send">
                        </fieldset>
<%--                        <input type="hidden" name="_template" value="box">--%>
<%--                        <input type="hidden" name="_subject" value="Feedback From a User">--%>
<%--                        <input type="hidden" name="_autoresponse" value="Thank you for your Feedback">--%>
<%--                        <input type="hidden" name="_next" value="http://localhost:8080/TicketBookingSystem_war_exploded/">--%>

                    </form>
                </div>
            </div>
        </div>
    </footer>
</div>
</body>
</html>
