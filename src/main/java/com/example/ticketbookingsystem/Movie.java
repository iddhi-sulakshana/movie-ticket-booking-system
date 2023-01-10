package com.example.ticketbookingsystem;

import com.mongodb.client.MongoCollection;

import java.util.List;

import static com.mongodb.client.model.Filters.eq;

public class Movie extends Database{
    private MongoCollection<MovieStruct> collection = database.getCollection("movies", MovieStruct.class);
    public MovieStruct getMovie(int id) {
        return collection.find(eq("TMDBid", id)).first();
    }
}