package com.example.ticketbookingsystem;

import com.mongodb.client.MongoCollection;

public class Ticket extends Database{
    private MongoCollection<TicketStruct> collection = database.getCollection("tickets", TicketStruct.class);

}
