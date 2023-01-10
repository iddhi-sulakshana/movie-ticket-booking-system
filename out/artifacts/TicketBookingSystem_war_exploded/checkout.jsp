<%@include file="./header.jsp" %>
    <title>ABC Movies</title>
    <link rel="stylesheet" href="./css/checkout.css">
    <script defer src="./js/checkout.js"></script>
<%@include file="./nav.jsp" %>
<!-- Section -->
    <div class="container p-lg-2">
        <div class="row my-2">
            <div class="col-12 col-lg-8 p-2">
                <div class="display p-2 rounded">
                    <form action="">
                        <div class="row p-2 align-items-center justify-content-center">
                            <div class="col col-12 col-lg-6">
                                <div class="form-floating mb-3">
                                    <input type="email" class="form-control" id="email" placeholder="enter email" autocomplete="off" required>
                                    <label for="email">Email address</label>
                                </div>
                            </div>
                            <div class="col col-12 col-lg-6">
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="phone" placeholder="enter phone" autocomplete="off" required>
                                    <label for="phone">Phone no</label>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-check my-1">
                                    <input class="form-check-input" type="checkbox" id="accept" required>
                                    <label class="form-check-label" for="accept">
                                        I have verified the movie name, show date and time before proceeding to payment.
                                    </label>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="text-center">Payment method</div>
                        <div class="row">
                            <div class="col px-5 py-3">
                                <button class="btn btn-success w-100"><i class="fa-brands fa-paypal"></i> Paypal</button>
                            </div>
                            <div class="col px-5 py-3">
                                <button class="btn btn-success w-100"><i class="fa-brands fa-cc-visa"></i> VISA</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-12 col-lg-4 p-2">
                <div class="display p-3 rounded">
                    <div class="title text-center">
                        Order Summary
                    </div>
                    <hr>
                    <div class="order-details">
                        <div class="row row-cols-auto d-flex justify-content-between">
                            <div class="col">
                                <div class="movie-title">Avatar 2</div>
                                <div class="seat-numbers">A1, B2</div>
                            </div>
                            <div class="col text-center align-items-center justify-content-center">
                                <div class="tickets">2</div>
                                <div class="ticket-label">Tickets</div>
                            </div>
                        </div>
                        <div class="time my-2"></div>
                    </div>
                    <hr>
                    <div class="row row-cols-auto lign-items-center justify-content-between">
                        <div class="col">
                            <div class="price-label">Subtotal:</div>
                        </div>
                        <div class="col text-center align-items-center justify-content-center">
                            <div class="amount">20.00</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col p-2">
                <div class="display">
                    <div class="title text-center py-3">Disclaimer</div>
                    <div class="row p-4 py-0">
                        <div class="col-lg-6">
                            <ol>
                                <li>Ticket purchased is valid only for the particular show & cannot be exchanged or used for other shows.</li>
                                <li>We recommend that you arrive at least 30 minutes prior at the venue to pick up your physical tickets.</li>
                                <li>The event is subject to government permissions. In case the permissions are not granted and event is canceled, a refund shall be issued to all patrons.</li>
                                <li>Internet handling fee per ticket may be levied.</li>
                                <li>Persons under the influence of alcohol or any substances will not be allowed inside the venue, any kind of disrespect or harm to Actors & crew will not be tolerated.</li>
                                <li>Organizers reserve the right to perform security checks on invitees/members of the audience at the entry point for security reasons.</li>
                            </ol>
                        </div>
                        <div class="col-lg-6">
                            <ol start="7">
                                <li>Organizers or any of its agents, officers, employees shall not be responsible for any injury, damage, theft, losses or cost suffered at or as a result of the event or any part of it</li>
                                <li>Parking near or at the festival premises is at the risk of the vehicle owner. Organizer will not hold responsibility for any damage or theft of any vehicles within the stipulated parking premises of the festival.</li>
                                <li>Professional cameras, any form of recording instruments, arms and ammunition, narcotics, eatables, bottled water, beverages, alcohol, other liquids & pets are not allowed inside the venue.</li>
                                <li>This ticket permits entry only to one play. After parties may have other ticketing requirements and may be sold separately.</li>
                            </ol>
                        </div>
                    </div>
                </div>                
            </div>
        </div>
    </div>
<%@include file="./footer.jsp" %>