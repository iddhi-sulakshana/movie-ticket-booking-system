package com.example.ticketbookingsystem;

import java.util.Date;
import java.util.List;

public class TicketStruct {
    public int          ticketId;
    public int          TMDBid;
    public List<String> seats;
    public String       email;
    public String       name;
    public String       phone;
    public double       price;
    public String       transactionId;
    public Date         showDate;
    public String       showTime;
}
