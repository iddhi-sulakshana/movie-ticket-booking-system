<%@include file="./header.jsp" %>
    <title>ABC Movies</title>
    <link rel="stylesheet" href="./css/mDashboard.css">
    <link rel="stylesheet" href="./jquery/jquery-ui.css">
    <script defer src="./jquery/jquery.min.js"></script>
    <script defer src="./jquery/jquery-ui.min.js"></script>
    <script defer src="./jquery/jquery-ui.multidatespicker.js"></script>
    <script defer src="./js/mDashboard.js"></script>
<%@include file="./nav.jsp" %>
<!-- Menu -->
    <div class="menu menu-left" id="menu">
        <ul class="menu-bar">
            <li class="menu-item active p-3">
                <i class="fa-light fa-gauge menu-icon"></i>
                <span class="menu-text">Dashboard</span>
            </li>
            <li class="menu-item p-3">
                <i class="fa-light fa-pen-to-square menu-icon"></i>
                <span class="menu-text">Movies</span>
            </li>
            <li class="menu-item p-3">
                <i class="fa-light fa-plus menu-icon"></i>
                <span class="menu-text">Add</span>
            </li>
            <li class="menu-item p-3">
                <i class="fa-light fa-gear menu-icon"></i>
                <span class="menu-text">Settings</span>
            </li>
        </ul>
    </div>
<!-- Section -->
    <div class="display-wrapper">
        <div class="display">
        <!-- dashboard display -->
            <div class="dashboard px-2 row">
                <div class="col-lg-6 p-3">  
                    <div class="content p-3 rounded">
                        <h1 class="text-center">Movies</h1>
                        <div class="row row-cols-1 p-3 px-5 gap-3">
                            <div class="col sub-card rounded p-1 position-relative">
                                <div class="title">Spider Man</div>
                                <span class="position-absolute top-0 start-100 translate-middle badge rounded bg-danger">
                                    Live
                                </span>
                            </div>
                            <div class="col sub-card rounded p-1 position-relative">
                                <div class="title">Black Adam</div>
                                <span class="position-absolute top-0 start-100 translate-middle badge rounded bg-success">
                                    Next
                                </span>
                            </div>
                            <div class="col sub-card rounded p-1">
                                <div class="title">Black Adam</div>
                            </div>
                            <div class="col sub-card rounded p-1">
                                <div class="title">Black Adam</div>
                            </div>
                            <div class="col sub-card rounded p-1">
                                <div class="title">Black Adam</div>
                            </div>
                            <div class="col sub-card rounded p-1">
                                <div class="title">Black Adam</div>
                            </div>
                            <div class="col sub-card rounded p-1">
                                <div class="title">Black Adam</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 p-3">  
                    <div class="content p-3 rounded px-5">
                        <h1 class="text-center">Sales</h1>
                        <div class="row p-2 gap-3 text-center">
                            <div class="col sub-card rounded p-2">
                                <h4>Total Sales</h4>
                                <div class="price"><span class="tag">$</span>15.<span class="decimal">00</span></div>
                            </div>
                            <div class="col sub-card rounded p-2">
                                <h4>Today Sales</h4>
                                <div class="price"><span class="tag">$</span>10.<span class="decimal">00</span></div>
                            </div>
                        </div>
                        <hr>
                        <h3>Sales from Movie</h3>
                        <select name="" id="" class="form-select text-bg-dark my-3 w-100">
                            <option selected>Select movie</option>
                            <option value="mv1">Movie 1</option>
                            <option value="mv2">Movie 2</option>
                            <option value="mv3">Movie 3</option>
                        </select>
                        <div class="row p-2 gap-3 text-center">
                            <div class="col sub-card rounded p-2">
                                <h4>Total Sales</h4>
                                <div class="price"><span class="tag">$</span>15.<span class="decimal">00</span></div>
                            </div>
                            <div class="col sub-card rounded p-2">
                                <h4>Today Sales</h4>
                                <div class="price"><span class="tag">$</span>10.<span class="decimal">00</span></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <!-- Movies display -->
            <div class="movies p-3 row row-cols-1 row-cols-md-3 g-3 row-cols-lg-4 d-none">
                <!-- movie -->
                    <div class="col text-center">
                        <div class="content p-3 rounded">
                            <h4>Spider Man</h4>
                            <h5>far from the home</h5>
                            <button class="btn btn-outline-primary m-2" type="button" data-bs-toggle="collapse" data-bs-target="#showtime" aria-expanded="false" aria-controls="showtime">
                                Show Times
                            </button>
                            <div class="collapse" id="showtime">
                                <div class="card card-body text-bg-dark">
                                <div class="row g-2 row-cols-1">
                                    <div class="col text-decoration-line-through">2022-02-04 22:30</div>
                                    <div class="col text-decoration-line-through">2022-02-04 22:30</div>
                                    <div class="col">2022-02-04 22:30</div>
                                    <div class="col">2022-02-04 22:30</div>
                                    <div class="col">2022-02-04 22:30</div>
                                    <div class="col">2022-02-04 22:30</div>
                                </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row g-2">
                                <div class="col">
                                    <button class="btn btn-outline-danger">Delete</button>
                                </div>
                                <div class="col">
                                    <button class="btn btn-outline-success">Edit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                <!-- end movie -->
                <!-- movie -->
                    <div class="col text-center">
                        <div class="content p-3 rounded">
                            <h4>Spider Man</h4>
                            <h5>far from the home</h5>
                            <button class="btn btn-outline-primary m-2" type="button" data-bs-toggle="collapse" data-bs-target="#showtime1" aria-expanded="false" aria-controls="showtime1">
                                Show Times
                            </button>
                            <div class="collapse" id="showtime1">
                                <div class="card card-body text-bg-dark">
                                <div class="row g-2 row-cols-1">
                                    <div class="col text-decoration-line-through">2022-02-04 22:30</div>
                                    <div class="col text-decoration-line-through">2022-02-04 22:30</div>
                                    <div class="col">2022-02-04 22:30</div>
                                    <div class="col">2022-02-04 22:30</div>
                                    <div class="col">2022-02-04 22:30</div>
                                    <div class="col">2022-02-04 22:30</div>
                                </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row g-2">
                                <div class="col">
                                    <button class="btn btn-outline-danger">Delete</button>
                                </div>
                                <div class="col">
                                    <button class="btn btn-outline-success">Edit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                <!-- end movie -->
                <!-- movie -->
                    <div class="col text-center">
                        <div class="content p-3 rounded">
                            <h4>Spider Man</h4>
                            <h5>far from the home</h5>
                            <button class="btn btn-outline-primary m-2" type="button" data-bs-toggle="collapse" data-bs-target="#showtime2" aria-expanded="false" aria-controls="showtime2">
                                Show Times
                            </button>
                            <div class="collapse" id="showtime2">
                                <div class="card card-body text-bg-dark">
                                <div class="row g-2 row-cols-1">
                                    <div class="col text-decoration-line-through">2022-02-04 22:30</div>
                                    <div class="col text-decoration-line-through">2022-02-04 22:30</div>
                                    <div class="col">2022-02-04 22:30</div>
                                    <div class="col">2022-02-04 22:30</div>
                                    <div class="col">2022-02-04 22:30</div>
                                    <div class="col">2022-02-04 22:30</div>
                                </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row g-2">
                                <div class="col">
                                    <button class="btn btn-outline-danger">Delete</button>
                                </div>
                                <div class="col">
                                    <button class="btn btn-outline-success">Edit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                <!-- end movie -->
                <!-- movie -->
                    <div class="col text-center">
                        <div class="content p-3 rounded">
                            <h4>Spider Man</h4>
                            <h5>far from the home</h5>
                            <button class="btn btn-outline-primary m-2" type="button" data-bs-toggle="collapse" data-bs-target="#showtime3" aria-expanded="false" aria-controls="showtime3">
                                Show Times
                            </button>
                            <div class="collapse" id="showtime3">
                                <div class="card card-body text-bg-dark">
                                <div class="row g-2 row-cols-1">
                                    <div class="col text-decoration-line-through">2022-02-04 22:30</div>
                                    <div class="col text-decoration-line-through">2022-02-04 22:30</div>
                                    <div class="col">2022-02-04 22:30</div>
                                    <div class="col">2022-02-04 22:30</div>
                                    <div class="col">2022-02-04 22:30</div>
                                    <div class="col">2022-02-04 22:30</div>
                                </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row g-2">
                                <div class="col">
                                    <button class="btn btn-outline-danger">Delete</button>
                                </div>
                                <div class="col">
                                    <button class="btn btn-outline-success">Edit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                <!-- end movie -->
                <!-- movie -->
                    <div class="col text-center">
                        <div class="content p-3 rounded">
                            <h4>Spider Man</h4>
                            <h5>far from the home</h5>
                            <button class="btn btn-outline-primary m-2" type="button" data-bs-toggle="collapse" data-bs-target="#showtime4" aria-expanded="false" aria-controls="showtime4">
                                Show Times
                            </button>
                            <div class="collapse" id="showtime4">
                                <div class="card card-body text-bg-dark">
                                <div class="row g-2 row-cols-1">
                                    <div class="col text-decoration-line-through">2022-02-04 22:30</div>
                                    <div class="col text-decoration-line-through">2022-02-04 22:30</div>
                                    <div class="col">2022-02-04 22:30</div>
                                    <div class="col">2022-02-04 22:30</div>
                                    <div class="col">2022-02-04 22:30</div>
                                    <div class="col">2022-02-04 22:30</div>
                                </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row g-2">
                                <div class="col">
                                    <button class="btn btn-outline-danger">Delete</button>
                                </div>
                                <div class="col">
                                    <button class="btn btn-outline-success">Edit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                <!-- end movie -->
            </div>
        <!-- Insert Movie Display -->
            <div class="add px-2 row row d-none">
                <div class="col-12 p-3">
                    <div class="content p-3 rounded">
                        <h3 class="text-center">Insert Movie</h3>
                        <form action="" method="GET" class="row g-4">
                            <div class="col-lg-6">
                                <label for="name" class="form-label">Movie Name</label>
                                <input type="text" class="form-control" id="name" placeholder="Enter movie name">
                            </div>
                            <div class="col-lg-6">
                                <label for="slogan" class="form-label">Movie Slogan</label>
                                <input type="text" class="form-control" id="slogan" placeholder="Enter movie slogan">
                            </div>
                            <div class="col-lg-6">
                                <label for="timeslot" class="form-label d-block">Time Slot : </label>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="timeslot" id="time1" value="9:00">
                                    <label class="form-check-label" for="time1">9:00</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="timeslot" id="time2" value="13:00">
                                    <label class="form-check-label" for="time2">13:00</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="timeslot" id="time3" value="16:00">
                                    <label class="form-check-label" for="time3">16:00</label>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <label for="movietype" class="form-label d-block">Movie Status : </label>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="movietype" id="released" value="released">
                                    <label class="form-check-label" for="released">Released</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="movietype" id="Upcoming" value="upcoming">
                                    <label class="form-check-label" for="Upcoming">Upcoming</label>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <label for="slogan" class="form-label">Movie Dates</label>
                                <input type="text" class="form-control showdates" placeholder="Pick the Movie dates" autocomplete="off" name="showdates">
                            </div>
                            <div class="col-lg-6">
                                <label for="price" class="form-label">Ticket Price</label>
                                <input type="text" class="form-control" id="price" placeholder="Ticket Price">
                            </div>
                            <div class="col-12">
                                <div class="row g-4">
                                    <div class="col-lg-6">
                                        <button class="btn btn-outline-danger w-100" type="reset">Reset</button>
                                    </div>
                                    <div class="col-lg-6">
                                        <button class="btn btn-outline-success w-100" type="submit">Insert</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        <!-- Settings Display -->
            <div class="settings px-2 row row d-none">
                <div class="col-12 p-3">
                    <div class="content p-3 rounded">
                        <form action="#">
                            <div class="form-outline mb-4">
                                <label class="form-label" for="email">Email address</label>
                                <input type="email" id="email" class="form-control" placeholder="Email..." value="123@gmail.com" disabled required>
                            </div>
                            <div class="form-outline mb-4">
                                <label class="form-label" for="password">Password</label>
                                <input type="password" id="password" class="form-control" placeholder="Password...." value="12345678" disabled required=""/>
                            </div>
                            <div class="row gap-2 text-center">
                                <div class="col">
                                    <button type="button" id="logout" class="btn btn-outline-danger">Log out</button>
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
            </div>
        </div>
    </div>
<%@include file="./footer.jsp" %>