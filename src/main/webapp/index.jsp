<%@ page import="com.example.ticketbookingsystem.Movie" %>
<%@ page import="com.example.ticketbookingsystem.MovieStruct" %>
<%@ page import="com.example.ticketbookingsystem.tmdbAPI" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@include file="./header.jsp" %>
    <title>ABC Movies</title>
    <link rel="stylesheet" href="./css/home.css">
<script defer src="./jquery/jquery.min.js"></script>
    <script defer src="./js/home.js"></script>
<%@include file="./nav.jsp" %>
<%
    Date now = new Date();
    Movie movieObj = new Movie();
    List<MovieStruct> movies = movieObj.getMovies();
    MovieStruct popular = movies.get(movies.size() - 1);
%>
<!-- Cover -->

    <div id="hero" class="p-lg-5 p-0" style="background-image: url('https://image.tmdb.org/t/p/original<%=popular.banner%>');">
        <div class="container h-100 d-flex align-items-center">
            <div class="cover">
                <h1 class="display-1 cover-header"><%=popular.title%></h1>
                <p class="w-lg-50 cover-description">
                    <%=popular.description%>
                </p>
                <button class="btn btn-lg btn-primary" onclick="document.location='./selectSeat.html'">Book now</button>
                <button class="btn btn-lg btn-success mx-2" onclick="document.location='./movie.jsp?movieId=<%=popular.TMDBid%>'">More...</button>
            </div>
        </div>
    </div>
<!-- Section Now Showing -->
    <section class="container p-5 text-center movies">
        <h1 class="display-5 mb-3 section-header">Now Showing</h1>
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-4">
        <% for(MovieStruct movie : movies) {
            boolean showing = false;
            // check movie date
            for(Date date : movie.showdates){
                if(date.before(now)){
                    showing = true;
                    break;
                }
            }
            if(!showing){
                continue;
            }%>
            <div class="col">
                <div class="card text-bg-dark rounded-4">
                    <img src="https://image.tmdb.org/t/p/original<%=movie.poster%>" alt="card-img">
                    <div class="card-img-overlay d-flex flex-column align-items-center justify-content-around">
                        <h5 class="card-title"><%=movie.title%></h5>
                        <p class="card-text">
                        <%
                            if(movie.description.length() > 225){
                        %><%=movie.description.substring(0, 225)%><%}else{%><%=movie.description%><%}%>
                        ...</p>
                        <button class="btn btn-outline-primary" onclick="document.location='./movie.jsp?movieId=<%=movie.TMDBid%>'">More Details...</button>
                    </div>
                </div>
            </div>
        <%}%>
        </div>
    </section>
<!-- Section Upcoming -->
    <section class="container p-5 text-center movies" id="upcoming">
        <h1 class="display-5 mb-3 section-header">Upcoming</h1>
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-4">
            <% for(MovieStruct movie : movies) {
                boolean showing = false;
                // check movie date
                for(Date date : movie.showdates){
                    if(date.before(now)){
                        showing = true;
                        break;
                    }
                }
                if(showing){
                    continue;
                }%>
            <div class="col">
                <div class="card text-bg-dark rounded-4">
                    <img src="https://image.tmdb.org/t/p/original<%=movie.poster%>" alt="card-img">
                    <div class="card-img-overlay d-flex flex-column align-items-center justify-content-around">
                        <h5 class="card-title"><%=movie.title%></h5>
                        <p class="card-text"><%=movie.description.substring(0, 225)%>...</p>
                        <button class="btn btn-outline-primary" onclick="document.location='./movie.jsp?movieId=<%=movie.TMDBid%>'">More Details...</button>
                    </div>
                </div>
            </div>
            <%}%>
        </div>
    </section>
<%@include file="./footer.jsp" %>