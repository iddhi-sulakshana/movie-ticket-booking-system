<%@ page import="com.example.ticketbookingsystem.*" %>
<%@include file="./header.jsp" %>
    <title>ABC Movies</title>
    <link rel="stylesheet" href="./css/movie.css">
<%@include file="./nav.jsp" %>

<%--<%--%>
<%--    Movie movieObj = new Movie();--%>


<%--//    Essentials es = new Essentials();--%>
<%--//    if(request.getParameter("movieId").trim() == null || !es.isInt(request.getParameter("movieId"))){--%>
<%--//        session.setAttribute("error", "Invalid request");--%>
<%--//        response.sendRedirect("./");--%>
<%--//        return;--%>
<%--//    }--%>
<%--//    MovieStruct movie = new MovieStruct();--%>
<%--//    movie.TMDBid = Integer.parseInt(request.getParameter("movieId"));--%>
<%--//    movie = movieObj.getMovie(movie.TMDBid);--%>
<%--//    movieObj.close();--%>

<%--%>--%>

<%
    Movie movieObj = new Movie();
    MovieStruct ms = new MovieStruct();
    ms.TMDBid = Integer.parseInt(request.getParameter("movieId"));
    ms = movieObj.getMovie(ms.TMDBid);

    String movieId = request.getParameter("movieId");
    tmdbAPI api = new tmdbAPI();
    MovieDetails movie = api.getMovieDetails(movieId);


%>



<div class="container mt-5 mb-5">

    <div class="row align-items-center mb-5">
        <div class="col-lg-4 col-sm-12 movie-poster d-flex justify-content-start">
            <div id="movie" class="">
                <img src="https://image.tmdb.org/t/p/original<%= ms.poster %>" alt="movie poster" />
            </div>
        </div>
        <div class="col-lg-6 col-sm-10 mt-3 movie-title movie-details d-flex flex-column ">
            <h2 class="movietitle mb-4"><%= ms.title %></h2>
            <span class="movie-plot-title mb-2" style="color: white">Overview:</span>
            <span class="movie-plot-body mb-3" style="color: white"><%= ms.description %></span>
            <span class="movie-director mb-3" style="color: white">Director:<span class="movie-director-name ms-1 mb-3"><%=movie.director%></span></span>
            <span class="movie-genre-title mb-3" style="color: white">Genres:
              <%
                  String[] genres = ms.genres.toArray(new String[0]);
                  for (int i = 0; i < genres.length; i++) {
              %>
              <span class=" ms-1"><%= genres[i] %></span>
              <% } %>
              </span>
            <span class="movie-genre mb-3"></span>
            <a class="btn btn-primary col-3" href="#" role="button">Buy Tickets</a>
        </div>
    </div>






    <%-- TOP CAST SECTION--%>

    <div class="row mt-5 mb-5">
        <div class="col-12">
            <h2 class="cast-title"><span class="v-dash">|</span> Top Cast</h2>
        </div>
    </div>
    <div class="row first-row">
        <%
            String[] actorName = movie.actorName;
            String[] characterName = movie.characterName;
            String[] profilePath = movie.profilePath;
            for (int i = 0; i < 4; i++) {
        %>
        <div class="col-lg-3 mt-3 mb-3 d-flex">
            <img src="https://image.tmdb.org/t/p/w500/<%= profilePath[i] %>" class="img-fluid actor-image rounded">
            <div class="row ms-1">
                <div class="col d-flex flex-column justify-content-center">
                    <p class="actor-name"><%= actorName[i] %></p>
                    <p class="character-name"><%= characterName[i] %></p>
                </div>
            </div>
        </div>

        <% } %>

    </div>
    <div class="row second-row">
        <div class="col-lg-3 col-sm-12 mt-sm-3 d-flex align-items-center order-4 cast-see-more">
            <a href="https://www.imdb.com/title/<%=movie.imdbID%>/fullcredits?ref_=tt_cl_sm" target="_blank">
                <button type="button" class="btn btn-link see-more-link" style="text-decoration: none !important;">
                    <h4 class="see-more" style="font-weight: 700; color: white;">SEE MORE
                        <span class="v-dash">></span>
                    </h4>
                </button>
            </a>
        </div>
        <%
            for (int i = 4; i < 7; i++) {
        %>
        <div class="col-lg-3 mt-3 mb-3 d-flex">
            <img src="https://image.tmdb.org/t/p/w500/<%= profilePath[i] %>" class="img-fluid actor-image rounded">
            <div class="row ms-1">
                <div class="col d-flex flex-column justify-content-center">
                    <p class="actor-name"><%= actorName[i] %></p>
                    <p class="character-name"><%= characterName[i] %></p>
                </div>
            </div>
        </div>

        <% } %>
    </div>

    <div class="row mt-5">
        <div class="col col-12">
            <h2 class="cast-title"><span class="v-dash">|</span> User Reviews</h2>
        </div>
    </div>
    <div class="row mt-4 row-col-1 ">
        <%
            String review = movie.reviewBody;
            if( review.length() > 2) {
        %>
        <div class="col-lg-6 col-12 border rounded">
            <div class="row mt-4">

                <div class="col-lg-6 col-12">
                    <div class="feature-review" ><span style="color: #f5c518; font-weight: bold">Featured Review</span></div>
                </div>
                <div class="col-lg-6 col-12">
                    <div class="author-rating d-flex justify-content-end align-items-center"><i class="fas fa-star review-star m-1"></i><span><%= movie.reviewRating %>/10</span></div>
                </div>
            </div>
            <div class="row mt-4 mb-2 row-col-1 flex-column">
                <div class="col-lg-12">
                    <div class="review">
                        <%
                            String reviewTitle = movie.reviewTitle;
                            if (reviewTitle.length() > 2) {
                        %>
                        <h3 class="review-title"><%= movie.reviewTitle %></h3>
                        <% } %>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="review">
                        <span class="review-body"><%= movie.reviewBody %></span>
                        <span class="review-see-more">
                                  <a href="https://www.imdb.com/title/<%=movie.imdbID%>/reviews?ref_=tt_urv" target="_blank">
                                      <button type="button" class="btn btn-link see-more-link" style="text-decoration: none !important;">
                                      <h5 class="see-more" style="font-weight: 700; color: white; font-size:12px ">SEE MORE <span class="v-dash">></span></h5>
                                  </button>
                                  </a>
                              </span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-12 mb-3 review-author"><i class="fas fa-user"></i><span class="ms-2"><%= movie.author %></span></div>
                <div class="col-lg-4 col-12 mb-3 review-date"><i class="fas fa-calendar"></i><span class="ms-2"><%= movie.reviewDate %></span></div>
            </div>
        </div>
        <% } else {%>

        <div class="col-lg-6 col-12">
            <div class="feature-review" ><h5 style="color: #f5c518; font-weight: bold">No Reviews Yet.</h5></div>
        </div>

        <% } %>
    </div>
</div>


<%@include file="./footer.jsp" %>
