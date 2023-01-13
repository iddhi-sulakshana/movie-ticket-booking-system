<%@ page import="com.example.ticketbookingsystem.Movie" %>
<%@ page import="com.example.ticketbookingsystem.Essentials" %>
<%@ page import="com.example.ticketbookingsystem.MovieStruct" %>
<%@include file="./header.jsp" %>
    <title>ABC Movies</title>
    <link rel="stylesheet" href="./css/movie.css">
<%@include file="./nav.jsp" %>
<%
    Movie movieObj = new Movie();
    Essentials es = new Essentials();
    if(request.getParameter("movieId").trim() == null || !es.isInt(request.getParameter("movieId"))){
        session.setAttribute("error", "Invalid request");
        response.sendRedirect("./");
        return;
    }
    MovieStruct movie = new MovieStruct();
    movie.TMDBid = Integer.parseInt(request.getParameter("movieId"));
    movie = movieObj.getMovie(movie.TMDBid);
    movieObj.close();
%>
<!-- Section -->
    <div class="container rounded cover my-2" style="background-image: url('https://image.tmdb.org/t/p/original<%=movie.banner%>');">
        <div class="details p-4 w-md-25">
            <h1><%=movie.title.split(":")[0]%></h1>
            <%
                if(movie.title.split(":").length == 2) {
            %>
            <h3><%=movie.title.split(":")[1]%></h3>
            <%}%>

            <div class="tags my-4 d-flex gap-3">
                <%for(String genre : movie.genres){%>
                    <div class="tag p-1 rounded"><%=genre%></div>
                <%}%>
            </div>
        </div>
    </div>
    <div class="container my-3 rounded p-3">
        <div class="row align-items-center">
            <div class="col-lg-10">
                <p><%=movie.description%></p>
            </div>
            <div class="col-lg-auto">
                <button class="btn btn-lg w-100 btn-outline-success" onclick="document.location='./selectSeat.jsp?movieId=<%=movie.TMDBid%>'">Book Now</button>
            </div>
        </div>
    </div>
<%@include file="./footer.jsp" %>