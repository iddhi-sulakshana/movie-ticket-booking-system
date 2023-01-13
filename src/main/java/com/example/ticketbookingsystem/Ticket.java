package com.example.ticketbookingsystem;

import com.mongodb.BasicDBObject;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;
import org.bson.conversions.Bson;

import java.util.Date;

public class Ticket extends Database{
    private MongoCollection<TicketStruct> collection = database.getCollection("tickets", TicketStruct.class);
    public void getSeatsInMovie(int TMDBid, String showtime, Date showDate){
    }
}
