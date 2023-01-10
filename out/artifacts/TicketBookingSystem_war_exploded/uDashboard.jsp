<%@include file="./header.jsp" %>
    <title>ABC Movies</title>
    <link rel="stylesheet" href="./css/uDashboard.css">
    <script defer src="./js/uDashboard.js"></script>
<%@include file="./nav.jsp" %>
<!-- Section -->
    <section class="container p-lg-2">
        <div class="row">
        <!-- Settings -->
            <div class="col-lg-8 p-3">
                <div class="dcontent p-4 rounded-3">
                <!-- top bar -->
                    <div class="container mt-3">
                        <div class="row justify-content-between">
                            <div class="col-auto">
                                <h1>Welcome Name Name</h1>
                            </div>
                            <div class="col-auto">
                                <button class="btn btn-lg btn-outline-danger" data-bs-toggle="modal" data-bs-target="#logoutModal">Log out</button>
                            </div>
                        </div>
                    </div>
                    <hr>
                <!-- Settings bar -->
                    <h4 class="text-center mb-4">Settings</h4>
                    <form action="#">
                        <div class="row mb-4">
                            <div class="col-md-6">
                                <div class="form-outline">
                                    <label class="form-label" for="fName">First name</label>
                                    <input type="text" class="form-control" id="fName" placeholder="First Name..." value="Name" disabled required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-outline">
                                    <label class="form-label" for="lName">Last name</label>
                                    <input type="text" class="form-control" id="lName" placeholder="Last Name..." value="Name" disabled required>
                                </div>
                            </div>
                        </div>
                        <div class="form-outline mb-4">
                            <label class="form-label" for="email">Email address</label>
                            <input type="email" id="email" class="form-control" placeholder="Email..." value="123@gmail.com" disabled required>
                        </div>
                        <div class="form-outline mb-4">
                            <label class="form-label" for="phoneNo">Phone Number</label>
                            <input type="text" id="phoneNo" class="form-control" placeholder="Phone No...." value="0123456789" disabled required>
                        </div>
                        <div class="form-outline mb-4">
                            <label class="form-label" for="password">Password</label>
                            <input type="password" id="password" class="form-control" placeholder="Password...." value="12345678" disabled required=""/>
                        </div>
                        <div class="row gap-2 text-center">
                            <div class="col">
                                <button type="button" id="deleteAcc" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">Delete Account</button>
                            </div>
                            <div class="col">
                                <button type="button" id="editAcc" class="btn btn-outline-warning">Edit Account</button>
                            </div>
                            <div class="col">
                                <button type="submit" id="saveAcc" disabled class="btn btn-outline-success">Save Changes</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        <!-- Tickets -->
            <div class="col-lg-4 p-3">
                <div class="dcontent p-4 rounded-3">
                    <h4 class="text-center mb-4">Tickets</h4>
                    <div class="row text-center text-danger d-none">
                        <div class="col">
                            <h3>No Tickets</h3>
                        </div>
                    </div>
                    <div class="row row-cols-1 gap-3">
                        <!-- ticket -->
                        <div class="col">
                            <div class="ticket p-2 px-4">
                                <div class="row text-center">
                                    <div class="col-sm-2 price d-flex justify-content-center align-items-center">
                                        <p>$50.00</p>
                                    </div>
                                    <div class="col-sm-8 my-3">
                                        <div class="t-title">Spider Man</div>
                                        <div class="t-time"><i class="fa-light fa-calendar-days"></i> 2022/02/03</div>
                                        <div class="t-time"><i class="fa-light fa-clock"></i> 06:00 PM</div>
                                        <div class="row mt-2">
                                            <div class="col">
                                                <button class="btn btn-outline-danger">Cancel</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-2 d-grid seat">
                                        <i class="fa-light fa-seat-airline"></i>
                                        <div>A3</div>
                                        <div>B3</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end ticket -->
                        <div class="col">
                            <div class="ticket p-2 px-4">
                                <div class="row text-center">
                                    <div class="col-sm-2 price d-flex justify-content-center align-items-center">
                                        <p>$50.00</p>
                                    </div>
                                    <div class="col-sm-8 my-3">
                                        <div class="t-title">Spider Man</div>
                                        <div class="t-date"><i class="fa-light fa-calendar-days"></i> 2022/02/03</div>
                                        <div class="t-time"><i class="fa-light fa-clock"></i> 06:00 PM</div>
                                        <div class="row mt-2">
                                            <div class="col">
                                                <button class="btn btn-outline-danger">Cancel</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-2 d-grid seat">
                                        <i class="fa-light fa-seat-airline"></i>
                                        <div>A3</div>
                                        <div>B3</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
 <!-- Logout modal -->
    <div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content text-bg-dark">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="logoutModalLabel">Log Out !</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Do you want to Log out?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-warning" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-outline-danger">Log out</button>
                </div>
            </div>
        </div>
    </div>
 <!-- delete modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content text-bg-dark">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="deleteModalLabel">Delete !</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Deleting account will remove everything from the system and it will unreversable action do you still want to delete the account?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-success" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-outline-danger">Delete</button>
                </div>
            </div>
        </div>
    </div>
<%@include file="./footer.jsp" %>