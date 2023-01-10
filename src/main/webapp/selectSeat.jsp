<%@include file="./header.jsp" %>
    <title>ABC Movies</title>
    <link rel="stylesheet" href="./jquery/jquery-ui.css">
    <link rel="stylesheet" href="./css/selectSeat.css">
    <script defer src="./jquery/jquery.min.js"></script>
    <script defer src="./jquery/jquery-ui.min.js"></script>
    <script defer src="./js/selectSeat.js"></script>
<%@include file="./nav.jsp" %>
<!-- Section -->
    <div class="container rounded p-3 my-3">
        <div class="row g-5 row-cols-1">
            <div class="col p-3 text-center">
                <h1>Black Adam</h1>
                <form action="./checkout.html" id="checkout-form" novalidate>
                    <input type="text" name="moviename" value="Black Adam" hidden>
                <div class="row my-3 px-5 g-4 align-items-center">
                    <div class="col-lg-6">
                        <input type="text" class="form-control moviedate" placeholder="Pick the Movie date" autocomplete="off" name="moviedate" required>
                    </div>
                    <div class="col-lg-6">
                        <select name="" id="" class="form-select text-bg-dark movietime" required>
                            <option selected value="">Select Movie Time</option>
                            <option value="9:00">9:00</option>
                            <option value="9:00">13:00</option>
                            <option value="9:00">16:00</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col d-flex flex-column align-items-center justify-content-center">
                <h3 class="title my-3">Screen</h3>
                <img src="./assets/primary-images/screen.png" class="w-100" alt="">
            </div>
            <div class="col d-flex flex-column align-items-center justify-content-center">
                <h3 class="title my-3">Seats</h3>
                <div class="seat-wrapper">
                    <ul class="seat-area">
                        <li class="seat-line">
                            <span class="seat-letter left">A</span>
                            <ul class="seat-row">
                                <li>
                                    <ul class="seat-group">
                                        <li class="seat"><div><span>1</span></div></li>
                                        <li class="seat"><div><span>2</span></div></li>
                                        <li class="seat"><div><span>3</span></div></li>
                                        <li class="seat"><div><span>4</span></div></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul class="seat-group">
                                        <li class="seat"><div><span>5</span></div></li>
                                        <li class="seat"><div><span>6</span></div></li>
                                        <li class="seat"><div><span>7</span></div></li>
                                        <li class="seat"><div><span>8</span></div></li>
                                        <li class="seat"><div><span>9</span></div></li>
                                        <li class="seat"><div><span>10</span></div></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul class="seat-group">
                                        <li class="seat"><div><span>11</span></div></li>
                                        <li class="seat"><div><span>12</span></div></li>
                                        <li class="seat"><div><span>13</span></div></li>
                                        <li class="seat"><div><span>14</span></div></li>
                                    </ul>
                                </li>
                            </ul>
                            <span class="seat-letter right">A</span>
                        </li>
                        <li class="seat-line">
                            <span class="seat-letter left">B</span>
                            <ul class="seat-row">
                                <li>
                                    <ul class="seat-group">
                                        <li class="seat"><div><span>1</span></div></li>
                                        <li class="seat"><div><span>2</span></div></li>
                                        <li class="seat"><div><span>3</span></div></li>
                                        <li class="seat"><div><span>4</span></div></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul class="seat-group">
                                        <li class="seat"><div><span>5</span></div></li>
                                        <li class="seat"><div><span>6</span></div></li>
                                        <li class="seat"><div><span>7</span></div></li>
                                        <li class="seat"><div><span>8</span></div></li>
                                        <li class="seat"><div><span>9</span></div></li>
                                        <li class="seat"><div><span>10</span></div></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul class="seat-group">
                                        <li class="seat"><div><span>11</span></div></li>
                                        <li class="seat"><div><span>12</span></div></li>
                                        <li class="seat"><div><span>13</span></div></li>
                                        <li class="seat"><div><span>14</span></div></li>
                                    </ul>
                                </li>
                            </ul>
                            <span class="seat-letter right">B</span>
                        </li>
                    </ul>
                    <ul class="seat-area">
                        <li class="seat-line">
                            <span class="seat-letter left">C</span>
                            <ul class="seat-row">
                                <li>
                                    <ul class="seat-group">
                                        <li class="seat"><div><span>1</span></div></li>
                                        <li class="seat"><div><span>2</span></div></li>
                                        <li class="seat"><div><span>3</span></div></li>
                                        <li class="seat"><div><span>4</span></div></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul class="seat-group">
                                        <li class="seat"><div><span>5</span></div></li>
                                        <li class="seat"><div><span>6</span></div></li>
                                        <li class="seat"><div><span>7</span></div></li>
                                        <li class="seat"><div><span>8</span></div></li>
                                        <li class="seat"><div><span>9</span></div></li>
                                        <li class="seat"><div><span>10</span></div></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul class="seat-group">
                                        <li class="seat"><div><span>11</span></div></li>
                                        <li class="seat"><div><span>12</span></div></li>
                                        <li class="seat"><div><span>13</span></div></li>
                                        <li class="seat"><div><span>14</span></div></li>
                                    </ul>
                                </li>
                            </ul>
                            <span class="seat-letter right">C</span>
                        </li>
                        <li class="seat-line">
                            <span class="seat-letter left">D</span>
                            <ul class="seat-row">
                                <li>
                                    <ul class="seat-group">
                                        <li class="seat"><div><span>1</span></div></li>
                                        <li class="seat"><div><span>2</span></div></li>
                                        <li class="seat"><div><span>3</span></div></li>
                                        <li class="seat"><div><span>4</span></div></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul class="seat-group">
                                        <li class="seat"><div><span>5</span></div></li>
                                        <li class="seat"><div><span>6</span></div></li>
                                        <li class="seat"><div><span>7</span></div></li>
                                        <li class="seat"><div><span>8</span></div></li>
                                        <li class="seat"><div><span>9</span></div></li>
                                        <li class="seat"><div><span>10</span></div></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul class="seat-group">
                                        <li class="seat"><div><span>11</span></div></li>
                                        <li class="seat"><div><span>12</span></div></li>
                                        <li class="seat"><div><span>13</span></div></li>
                                        <li class="seat"><div><span>14</span></div></li>
                                    </ul>
                                </li>
                            </ul>
                            <span class="seat-letter right">D</span>
                        </li>
                        <li class="seat-line">
                            <span class="seat-letter left">E</span>
                            <ul class="seat-row">
                                <li>
                                    <ul class="seat-group">
                                        <li class="seat"><div><span>1</span></div></li>
                                        <li class="seat"><div><span>2</span></div></li>
                                        <li class="seat"><div><span>3</span></div></li>
                                        <li class="seat"><div><span>4</span></div></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul class="seat-group">
                                        <li class="seat"><div><span>5</span></div></li>
                                        <li class="seat"><div><span>6</span></div></li>
                                        <li class="seat"><div><span>7</span></div></li>
                                        <li class="seat"><div><span>8</span></div></li>
                                        <li class="seat"><div><span>9</span></div></li>
                                        <li class="seat"><div><span>10</span></div></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul class="seat-group">
                                        <li class="seat"><div><span>11</span></div></li>
                                        <li class="seat"><div><span>12</span></div></li>
                                        <li class="seat"><div><span>13</span></div></li>
                                        <li class="seat"><div><span>14</span></div></li>
                                    </ul>
                                </li>
                            </ul>
                            <span class="seat-letter right">E</span>
                        </li>
                    </ul>
                    <ul class="seat-area">
                        <li class="seat-line">
                            <span class="seat-letter left">F</span>
                            <ul class="seat-row">
                                <li>
                                    <ul class="seat-group">
                                        <li class="seat"><div><span>1</span></div></li>
                                        <li class="seat"><div><span>2</span></div></li>
                                        <li class="seat"><div><span>3</span></div></li>
                                        <li class="seat"><div><span>4</span></div></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul class="seat-group">
                                        <li class="seat"><div><span>5</span></div></li>
                                        <li class="seat"><div><span>6</span></div></li>
                                        <li class="seat"><div><span>7</span></div></li>
                                        <li class="seat"><div><span>8</span></div></li>
                                        <li class="seat"><div><span>9</span></div></li>
                                        <li class="seat"><div><span>10</span></div></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul class="seat-group">
                                        <li class="seat"><div><span>11</span></div></li>
                                        <li class="seat"><div><span>12</span></div></li>
                                        <li class="seat"><div><span>13</span></div></li>
                                        <li class="seat"><div><span>14</span></div></li>
                                    </ul>
                                </li>
                            </ul>
                            <span class="seat-letter right">F</span>
                        </li>
                        <li class="seat-line">
                            <span class="seat-letter left">G</span>
                            <ul class="seat-row">
                                <li>
                                    <ul class="seat-group">
                                        <li class="seat"><div><span>1</span></div></li>
                                        <li class="seat"><div><span>2</span></div></li>
                                        <li class="seat"><div><span>3</span></div></li>
                                        <li class="seat"><div><span>4</span></div></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul class="seat-group">
                                        <li class="seat"><div><span>5</span></div></li>
                                        <li class="seat"><div><span>6</span></div></li>
                                        <li class="seat"><div><span>7</span></div></li>
                                        <li class="seat"><div><span>8</span></div></li>
                                        <li class="seat"><div><span>9</span></div></li>
                                        <li class="seat"><div><span>10</span></div></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul class="seat-group">
                                        <li class="seat"><div><span>11</span></div></li>
                                        <li class="seat"><div><span>12</span></div></li>
                                        <li class="seat"><div><span>13</span></div></li>
                                        <li class="seat"><div><span>14</span></div></li>
                                    </ul>
                                </li>
                            </ul>
                            <span class="seat-letter right">G</span>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col d-flex flex-column align-items-center justify-content-center">
                <div class="container row row-cols-1 row-cols-lg-3 align-items-center text-center g-3 py-2 px-3">
                    <div class="col">
                        <div class="checkout-title">Selected Seats</div>
                        <div class="checkout-sub seat-name w-100">A1, A2, B2, B3, B4</div>
                    </div>
                    <div class="col">
                        <div class="checkout-title">Total Price</div>
                        <div class="checkout-sub price">$150.00</div>
                    </div>
                    <div class="col">
                            <input type="text" name="seats" id="seat-name" hidden>
                            <input type="text" name="price" id="price" hidden>
                            <button class="btn btn-success w-100" type="submit">Check out</button>
                        </form>
                    </div>
                </div>
            </div>    
        </div>
    </div>
<%@include file="./footer.jsp" %>