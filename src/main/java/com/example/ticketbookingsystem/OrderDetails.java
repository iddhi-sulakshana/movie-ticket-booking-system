package com.example.ticketbookingsystem;

public class OrderDetails {

    private String customerFirstName;

    private String customerLastName;

    private String customerEmail;

    private String customerPhoneNumber;

    private String movieName;

    private String totalTickets;

    private String total;

    public OrderDetails(String customerFirstName, String customerLastName, String customerEmail, String customerPhoneNumber,
                       String movieName,String totalTickets, String total) {

        this.customerFirstName = customerFirstName;
        this.customerLastName = customerLastName;
        this.customerEmail = customerEmail;
        this.customerPhoneNumber = customerPhoneNumber;
        this.movieName = movieName;
        this.totalTickets = totalTickets;
        this.total = total;
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

    public String getTotalTickets(){
        return totalTickets;
    }

    public String getTotal() {
        return total;
    }




}
