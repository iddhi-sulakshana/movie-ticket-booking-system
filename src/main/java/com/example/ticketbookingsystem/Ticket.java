package com.example.ticketbookingsystem;

import com.mongodb.BasicDBObject;
import com.mongodb.BasicDBObjectBuilder;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;
import org.bson.BsonDocument;
import org.bson.BsonInt64;
import org.bson.Document;
import org.bson.conversions.Bson;

import java.util.Date;

import static com.mongodb.client.model.Filters.eq;

public class Ticket extends Database{
    private MongoCollection<TicketStruct> collection = database.getCollection("tickets", TicketStruct.class);
    public void getSeatsInMovie(int TMDBid, String showtime, String showDate){
        System.out.println(TMDBid);
        Document ticket = collection.find(eq("TMDBid", "76600"), Document.class).first();
        System.out.println(ticket.toJson());
    }
}
