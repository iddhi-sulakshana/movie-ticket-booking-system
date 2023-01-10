<%@include file="./header.jsp" %>
    <title>ABC Movies</title>
    <link rel="stylesheet" href="./css/home.css">
    <script defer src="./js/home.js"></script>
<%@include file="./nav.jsp" %>
<!-- Cover -->
    <div id="hero" class="p-lg-5 p-0" style="background-image: url('./assets/cover/cover1.jpg');">
        <div class="container h-100 d-flex align-items-center">
            <div class="cover">
                <h1 class="display-1 cover-header">Black Adam</h1>
                <p class="w-lg-50 cover-description">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure velit minus, ex quasi ea veniam nobis modi ut quia, ipsum magnam eos nisi animi sequi ab provident molestiae consequuntur laboriosam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure velit minus, ex quasi ea veniam nobis modi ut quia, ipsum magnam eos nisi animi sequi ab provident molestiae consequuntur laboriosam.
                </p>
                <button class="btn btn-lg btn-outline-primary">Book now</button>
                <button class="btn btn-lg btn-outline-success mx-2">More...</button>
            </div>
        </div>
    </div>
<!-- Section Now Showing -->
    <section class="container p-5 text-center movies">
        <h1 class="display-5 mb-3 section-header">Now Showing</h1>
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-4">
            <div class="col">
                <div class="card text-bg-dark rounded-4">
                    <img src="./assets/posters/poster1.jpg" alt="card-img">
                    <div class="card-img-overlay d-flex flex-column align-items-center justify-content-around">
                        <h5 class="card-title">Spider Man</h5>
                        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <button class="btn btn-outline-primary">More Details...</button>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card text-bg-dark rounded-4">
                    <img src="./assets/posters/poster1.jpg" alt="card-img">
                    <div class="card-img-overlay d-flex flex-column align-items-center justify-content-around">
                        <h5 class="card-title">Spider Man</h5>
                        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <button class="btn btn-outline-primary">More Details...</button>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card text-bg-dark rounded-4">
                    <img src="./assets/posters/poster1.jpg" alt="card-img">
                    <div class="card-img-overlay d-flex flex-column align-items-center justify-content-around">
                        <h5 class="card-title">Spider Man</h5>
                        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <button class="btn btn-outline-primary">More Details...</button>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card text-bg-dark rounded-4">
                    <img src="./assets/posters/poster1.jpg" alt="card-img">
                    <div class="card-img-overlay d-flex flex-column align-items-center justify-content-around">
                        <h5 class="card-title">Spider Man</h5>
                        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <button class="btn btn-outline-primary">More Details...</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
<!-- Section Upcoming -->
    <section class="container p-5 text-center movies" id="upcoming">
        <h1 class="display-5 mb-3 section-header">Upcoming</h1>
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-4">
            <div class="col">
                <div class="card text-bg-dark rounded-4">
                    <img src="./assets/posters/poster1.jpg" alt="card-img">
                    <div class="card-img-overlay d-flex flex-column align-items-center justify-content-around">
                        <h5 class="card-title">Spider Man</h5>
                        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <button class="btn btn-outline-success disabled">Release Date</button>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card text-bg-dark rounded-4">
                    <img src="./assets/posters/poster1.jpg" alt="card-img">
                    <div class="card-img-overlay d-flex flex-column align-items-center justify-content-around">
                        <h5 class="card-title">Spider Man</h5>
                        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <button class="btn btn-outline-success disabled">Release Date</button>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card text-bg-dark rounded-4">
                    <img src="./assets/posters/poster1.jpg" alt="card-img">
                    <div class="card-img-overlay d-flex flex-column align-items-center justify-content-around">
                        <h5 class="card-title">Spider Man</h5>
                        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <button class="btn btn-outline-success disabled">Release Date</button>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card text-bg-dark rounded-4">
                    <img src="./assets/posters/poster1.jpg" alt="card-img">
                    <div class="card-img-overlay d-flex flex-column align-items-center justify-content-around">
                        <h5 class="card-title">Spider Man</h5>
                        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <button class="btn btn-outline-success disabled">Release Date</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
<%@include file="./footer.jsp" %>