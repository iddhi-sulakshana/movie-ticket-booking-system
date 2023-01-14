package com.example.ticketbookingsystem;

public class Essentials {
    public boolean isInt(String number) {
        try {
            Integer.parseInt(number);
            return true;
        } catch(Exception ex){
            return false;
        }
    }
}
