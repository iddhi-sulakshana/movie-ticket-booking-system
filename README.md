# ABC Movies Ticket Booking System

**ABC Movies Ticket Booking System** is a comprehensive web application designed to facilitate movie ticket bookings at ABC Movies theaters. This project integrates with a Jakarta EE web server and MongoDB for data management. Key features include integration with TMDB API for movie data retrieval, automatic removal of movies without showtimes, server-side sessions for booking conflict prevention, PayPal integration for payments, user signup/login, and various administrative and user management functionalities.

## Features

-   **Movie Data Retrieval**: Retrieve movie details from TMDB API.
-   **Automatic Movie Management**: Remove movies without showtimes from selection pages.
-   **Session Management**: Server-side sessions to prevent booking conflicts.
-   **Payment Integration**: Integration with PayPal for secure payments.
-   **User Management**:

    -   **User Signup/Login**: Secure authentication for users.
    -   **Frontdesk Booking**: Ability for frontdesk users to book tickets without payment.
    -   **User Dashboard**: View booked tickets, cancel tickets, and edit personal details.
    -   **Feedback**: Users can provide feedback, which is sent via email to the admin.
    -   **SMS Notifications**: Send SMS notifications using Twilio API after successful PayPal payment.

-   **Admin Dashboard**:
    -   **Sales Tracking**: View total sales and sales for each movie.
    -   **Movie Management**: List movies, delete movies, and add new movies with TMDB API integration for automatic details retrieval.
    -   **Showtime Management**: Select showtimes, dates, and ticket prices.
    -   **Credential Management**: Admin can change login credentials.

## Technologies Used

-   **Java Jakarta EE**: Backend development framework.
-   **MongoDB**: NoSQL database for storing movie and user data.
-   **TMDB API**: Integration for movie data retrieval.
-   **PayPal API**: Integration for payment processing.
-   **Twilio API**: Integration for SMS notifications.
-   **HTML5/CSS3/JavaScript**: Frontend development technologies.

## Installation

To run this project locally:

1. Clone the repository:
    ```sh
    git clone https://github.com/iddhi-sulakshana/movie-ticket-booking-system.git
    ```
2. Set up your Jakarta EE web server (e.g., Apache TomEE) and MongoDB.
3. Import the project into your IDE (e.g., IntelliJ IDEA, Eclipse).
4. Configure the database connection in `/src/main/java/com/example/ticketbookingsystem/Database.java`.
5. Build and deploy the project to your local server.

## Contributors

This project was developed by:

-   [Iddhi](https://github.com/iddhi-sulakshana)
-   [Chamodh](https://github.com/chamodhpereira)
-   [Chanaka](https://github.com/gncranasingha)
-   [Pramodh](https://github.com/PramodMannapperuma)
-   [Vihansi](https://github.com/VihansiPerera)
-   [Buddhima](https://github.com/buddhimac111)

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to discuss any improvements or feature additions.

## Contact

For any inquiries or feedback, please raise an issue on the GitHub repository.

## Screenshots

### Home Page

![Home Page](/screenshots/home.png)

### Movie Details

![Movie Details](/screenshots/movie.png)

### Seat Select

![Seat Select](/screenshots/book.png)

### Checkout

![Checkout](/screenshots/checkout.png)

### Payment Review

![Payment Review](/screenshots/review_order.png)

### Complete Order

![Complete Order](/screenshots/complete.png)

### Management Dashboard

![Management Dashboard](/screenshots/mdashboard.png)

### User Dashboard

![User Dashboard](/screenshots/udashboard.png)

### SMS Notification

![SMS Notification](/screenshots/sms.png)

### Cancel Email

![Cancel Email](/screenshots/email.png)

### About Page

![About Page](/screenshots/about.png)
