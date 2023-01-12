package com.example.ticketbookingsystem;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Updates;
import org.bson.BsonArray;
import org.bson.BsonDocument;
import org.bson.BsonString;
import org.bson.conversions.Bson;

import java.io.IOException;
import java.util.List;

import static com.mongodb.client.model.Aggregates.set;
import static com.mongodb.client.model.Filters.eq;

public class Movie extends Database{
    private MongoCollection<MovieStruct> collection = database.getCollection("movies", MovieStruct.class);
    public MovieStruct getMovie(int id) {
        return collection.find(eq("TMDBid", id)).first();
    }
    public MovieStruct searchMovie(String title) {
        return collection.find(eq("title", title)).first();
    }
    public void deleteMovie(int id){
        collection.findOneAndDelete(eq("TMDBid", id));
    }
    public void updateMovie(int id, List<String> showdates, String showtime){
        BsonArray array = new BsonArray();
        for (String item: showdates) {
            array.add(new BsonString(item));
        }
        collection.updateOne(eq("TMDBid", id), Updates.combine(Updates.set("showdates", array), Updates.set("showtime", showtime)));
    }
    public void insertMovie(String title, List<String> showdates, String showtime) throws IOException {
        tmdbAPI api = new tmdbAPI();
        MovieStruct movie = api.getMovie(api.searchMovie(title));
        movie.showdates = showdates;
        movie.showtime = showtime;
        if(isExist(movie.TMDBid) == 0){
            collection.insertOne(movie);
        }
    }
    public int isExist(int id){
        MovieStruct movie = collection.find(eq("TMDBid", id)).first();
        if(movie == null)
            return 0;
        return 1;
    }
}