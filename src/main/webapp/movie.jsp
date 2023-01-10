<%@include file="./header.jsp" %>
    <title>ABC Movies</title>
    <link rel="stylesheet" href="./css/movie.css">
    <script defer src="./js/movie.js"></script>
<%@include file="./nav.jsp" %>
<!-- Section -->
    <div class="container rounded cover my-2" style="background-image: url(./assets/cover/cover2.jpg);">
        <div class="details p-4 w-md-25">
            <h1>Jumanji</h1>
            <h3>Welcome to the jungle</h3>
            <span><i class="fa-light fa-star"></i><i class="fa-light fa-star"></i><i class="fa-light fa-star"></i><i class="fa-light fa-star"></i><i class="fa-light fa-star-half"></i></span>
            <div class="tags d-flex gap-3">
                <div class="tag p-1 rounded">Action</div>
                <div class="tag p-1 rounded">Adventure</div>
            </div>
        </div>
        <button class="btn btn-outline-info rounded-pill play-btn"><i class="fa-light fa-play"></i></button>
        <div class="video-wrapper">
            <iframe src="https://www.youtube-nocookie.com/embed/2QKg5SZ_35I?controls=0" title="YouTube video player" frameborder="0" allow="autoplay; encrypted-media;"></iframe>
        </div>
    </div>
    <div class="container my-3 rounded p-3">
        <div class="row align-items-center">
            <div class="col-lg-10">
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam quos, ratione ad ea repellendus pariatur porro dolorem harum. Hic tenetur aliquam odio cumque a ex nisi explicabo iste molestiae minus!</p>    
            </div>
            <div class="col-lg-auto">
                <button class="btn btn-lg w-100 btn-outline-success" onclick="document.location='./selectSeat.html'">Book Now</button>
            </div>
        </div>
    </div>
<%@include file="./footer.jsp" %>