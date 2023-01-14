package com.example.ticketbookingsystem;

import java.util.List;

public class OrderDetails {

    private String movieID;

    private String customerFirstName;

    private String customerLastName;

    private String customerEmail;

    private String customerPhoneNumber;

    private String movieName;

    private String totalSeats;

    private List<String> seats;

    private String total;

    private String movieDate;

    private String movieTime;

    public OrderDetails(String customerFirstName, String customerLastName, String customerEmail, String customerPhoneNumber,
                       String movieName,String totalSeats, List<String> seats,String total, String movieID, String movieTime, String movieDate ) {

        this.customerFirstName = customerFirstName;
        this.customerLastName = customerLastName;
        this.customerEmail = customerEmail;
        this.customerPhoneNumber = customerPhoneNumber;
        this.movieName = movieName;
        this.totalSeats = totalSeats;
        this.seats = seats;
        this.total = total;
        this.movieID = movieID;
        this.movieDate = movieDate;
        this.movieTime = movieTime;
    }

    public String getCustomerFirstName() {
        return customerFirstName;
    }

    public String getCustomerLastName() {
        return customerLastName;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public String getCustomerPhoneNumber() {
        return customerPhoneNumber;
    }


    public String getMovieName(){
        return movieName;
    }

    public String getTotalSeats(){
        return totalSeats;
    }

    public String getTotal() {
        return total;
    }

    public String getMovieID() {
        return movieID;
    }

    public List<String> getSeats() {
        return seats;
    }
    public String getMovieTime(){
        return movieTime;
    }

    public String getMovieDate() {
        return movieDate;
    }
}
