package com.example.ticketbookingsystem;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoIterable;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Projections;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import static com.mongodb.client.model.Filters.eq;
import static com.mongodb.client.model.Sorts.ascending;
import static com.mongodb.client.model.Sorts.descending;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
public class Ticket extends Database{
    private MongoCollection<TicketStruct> collection = database.getCollection("tickets", TicketStruct.class);
    public List<String> getBookedSeats(int TMDBid, String showtime, String showdate){
        Bson filter = Filters.and(Filters.eq("TMDBid", TMDBid), Filters.eq("showtime", showtime), Filters.eq("showdate", showdate));
        MongoIterable<TicketStruct> ticket = collection.find(filter).projection(Projections.include("seats"));
        Iterator<TicketStruct> iterator = ticket.iterator();
        List<String> seats = new ArrayList<>();
        while(iterator.hasNext()){
            for (String seat : iterator.next().seats) {
                if(!seats.contains(seat))
                    seats.add(seat);
            }
        }
        return seats;
    }
    DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    public void insertTicket(TicketStruct ticket){
        int id = 0;
        TicketStruct tickets = collection.find().projection(Projections.include("ticketId")).sort(descending("_id")).first();
        if(tickets != null){
            id = tickets.ticketId + 1;
        }
        ticket.ticketId = ++id;
        ticket.showdate = String.format("%s-%s-%s", ticket.showdate.split("/")[2], ticket.showdate.split("/")[0], ticket.showdate.split("/")[1]);
        collection.insertOne(ticket);
    }
    public List<TicketStruct> getUserTickets(String email, String phone){
        MongoIterable<TicketStruct> ticketIt = collection.find(Filters.and(Filters.gt("showdate", format.format(new Date())), eq("email", email), eq("phone", phone)));
        List<TicketStruct> tickets = new ArrayList<>();
        Iterator<TicketStruct> iterator = ticketIt.iterator();
        while (iterator.hasNext()){
            tickets.add(iterator.next());
        }
        return tickets;
    }
    public void deleteTicket(int id, String email, String transactioId){
        collection.findOneAndDelete(Filters.and(eq("ticketId", id), eq("email", email), eq("transactionId", transactioId)));
    }
    public double getTotalSales(){
        MongoIterable<TicketStruct> ticket = collection.find().projection(Projections.include("price"));
        double total = 0.00;
        Iterator<TicketStruct> iterator = ticket.iterator();
        while (iterator.hasNext()){
            total += iterator.next().price;
        }
        return total;
    }
    public double getMovieSales(int id){
        MongoIterable<TicketStruct> ticket = collection.find(eq("TMDBid", id)).projection(Projections.include("price"));
        double total = 0.00;
        Iterator<TicketStruct> iterator = ticket.iterator();
        while (iterator.hasNext()){
            total += iterator.next().price;
        }
        return total;
    }
}
