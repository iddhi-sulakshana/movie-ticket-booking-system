<%@ page import="com.example.ticketbookingsystem.User" %>
<%@ page import="org.bson.types.ObjectId" %>
<%@ page import="com.example.ticketbookingsystem.UserStruct" %>
<%@ page import="com.example.ticketbookingsystem.Movie" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.ticketbookingsystem.MovieStruct" %>
<% //restrict accessing through url
    if(session.getAttribute("userID") == null){
        session.setAttribute("error", "Log in timeout");
        response.sendRedirect("./index.jsp");
        return;
    }
    ObjectId userId = (ObjectId) session.getAttribute("userID");
    String role = (String) session.getAttribute("logRole");
    User userObj = new User();
    if (role != "admin") {
        session.setAttribute("error", "Unauthorized page");
        response.sendRedirect("index.jsp");
        return;
    }
    UserStruct user = userObj.getUser(userId);
    userObj.close();
%>
<%@include file="./header.jsp" %>
    <title>ABC Movies</title>
    <link rel="stylesheet" href="./css/mDashboard.css">
    <link rel="stylesheet" href="./jquery/jquery-ui.css">
    <script defer src="./jquery/jquery.min.js"></script>
    <script defer src="./jquery/jquery-ui.min.js"></script>
    <script defer src="./jquery/jquery-ui.multidatespicker.js"></script>
    <script defer src="./js/mDashboard.js"></script>
<%@include file="./nav.jsp" %>
<%
    Movie movie = new Movie();
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    List<String> time1 = new ArrayList<>();
    for (Date date: movie.getDates("9:00")) {
        time1.add(String.format("'%s'", dateFormat.format(date)));
    }
    List<String> time2 = new ArrayList<>();
    for (Date date: movie.getDates("13:00")) {
        time2.add(String.format("'%s'", dateFormat.format(date)));
    }
    List<String> time3 = new ArrayList<>();
    for (Date date: movie.getDates("16:00")) {
        time3.add(String.format("'%s'", dateFormat.format(date)));
    }

    List<MovieStruct> movies = movie.getMovies();
    movie.close();
%>
<script>
    var time1array = <%=time1%>
    var time2array = <%=time2%>
    var time3array = <%=time3%>
</script>
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
                            <% for(MovieStruct item : movies) {%>
                            <div class="col sub-card rounded p-1 position-relative">
                                <div class="title"><%=item.title%></div>
                            </div>
                            <%}%>
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
                <%  int i = 0;
                    for(MovieStruct item : movies) {%>
                <!-- movie -->
                    <div class="col text-center">
                        <div class="content p-3 rounded">
                            <h4><%=item.title.split(":")[0]%></h4>
                            <%
                                if(item.title.split(":").length == 2) {
                            %>
                            <h5><%=item.title.split(":")[1]%></h5>
                            <%}%>
                            <button class="btn btn-outline-primary m-2" type="button" data-bs-toggle="collapse" data-bs-target="#showtime<%=i%>" aria-expanded="false" aria-controls="showtime<%=i%>">
                                Show Times
                            </button>
                            <div class="collapse" id="showtime<%=i%>">
                                <div class="card card-body text-bg-dark">
                                    <div class="row g-2 row-cols-1">
                                        <% for(Date date : item.showdates){%>
                                            <div class="col<%if(date.before(new Date())){%> text-decoration-line-through<%}%>"><%=dateFormat.format(date)%></div>
                                        <%}%>
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
                <%i++;}%>
                <div class="hidden-div"></div>
            </div>
        <!-- Insert Movie Display -->
            <div class="add px-2 row row d-none">
                <div class="col-12 p-3">
                    <div class="content p-3 rounded">
                        <h3 class="text-center">Insert Movie</h3>
                        <form action="./insertMovieServlet" method="POST" class="row g-4">
                            <div class="col-lg-6">
                                <label for="moviename" class="form-label">Movie Name</label>
                                <div class="row align-items-center justify-content-between">
                                    <div class="col-10">
                                        <input type="text" class="form-control" id="moviename" name="moviename" placeholder="Enter movie name" required>
                                    </div>
                                    <div class="col">
                                        <button class="btn btn-outline-primary" id="searchmovie" type="button"><i class="fa-light fa-search"></i></button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <label for="time1" class="form-label d-block">Time Slot : </label>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="timeslot" id="time1" value="9:00" required>
                                    <label class="form-check-label" for="time1">9:00</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="timeslot" id="time2" value="13:00" required>
                                    <label class="form-check-label" for="time2">13:00</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="timeslot" id="time3" value="16:00" required>
                                    <label class="form-check-label" for="time3">16:00</label>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <label for="showdates" class="form-label">Movie Dates</label>
                                <input type="text" id="showdates" class="form-control" hidden placeholder="Pick the Movie dates" autocomplete="off" name="showdates" required>
                            </div>
                            <div class="col-lg-6">
                                <label for="price" class="form-label">Ticket Price</label>
                                <input type="text" class="form-control" id="price" placeholder="Ticket Price" name="price" required>
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
                    <div class="content my-3 p-3" id="searchsection">
                        <h5>Search Result</h5>
                        <div class="row g-4">
                            <div class="col-lg-6">
                                <label for="searchname" class="form-label">Movie Name</label>
                                <input type="text" class="form-control" id="searchname" disabled>
                            </div>
                            <div class="col-lg-6">
                                <label for="searchgenres" class="form-label">Genres</label>
                                <input type="text" class="form-control" id="searchgenres" disabled>
                            </div>
                            <div class="col-lg-6">
                                <label for="searchoverview" class="form-label">Overview</label>
                                <input type="text" class="form-control" id="searchoverview" disabled>
                            </div>
                            <div class="col-lg-6">
                                <label for="searchgenres" class="form-label">Genres</label><br/>
                                <a href="" target="_blank" id="poster">Poster</a><br>
                                <a href="" target="_blank" id="banner">Banner</a>
                            </div>
                        </div>
                    </div>
                    <div class="hidden-div"></div>
                </div>
            </div>
        <!-- Settings Display -->
            <div class="settings px-2 row row d-none">
                <div class="col-12 p-3">
                    <div class="content p-3 rounded">
                        <form action="./updateUserServlet" method="post">
                            <div class="form-outline mb-4">
                                <label class="form-label" for="lName">Full name</label>
                                <input type="text" class="form-control" id="lName" name="fullname" placeholder="Enter full name" value="<%=user.fullName%>" disabled required>
                            </div>
                            <div class="form-outline mb-4">
                                <label class="form-label" for="email">Email address</label>
                                <input type="email" id="email" class="form-control" placeholder="Email..." name="email" value="<%=user.email%>" disabled required>
                            </div>
                            <div class="form-outline mb-4">
                                <label class="form-label" for="phoneNo">Phone Number</label>
                                <input type="text" id="phoneNo" class="form-control" placeholder="Phone No...." name="phone" value="<%=user.phone%>" disabled required>
                            </div>
                            <div class="form-outline mb-4">
                                <label class="form-label" for="password">Password</label>
                                <input type="password" id="password" class="form-control" placeholder="Password...." name="password" value="<%=user.password%>" disabled required=""/>
                            </div>
                            <div class="row gap-2 text-center">
                                <div class="col">
                                    <button type="button" class="btn btn-outline-danger" onclick="location.href= './logoutServlet'">Log out</button>
                                </div>
                                <div class="col">
                                    <button type="button" id="editAcc" class="btn btn-outline-warning">Edit Account</button>
                                </div>
                                <div class="col">
                                    <button type="submit" disabled id="saveAcc" class="btn btn-outline-success">Save Changes</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%@include file="./footer.jsp" %>