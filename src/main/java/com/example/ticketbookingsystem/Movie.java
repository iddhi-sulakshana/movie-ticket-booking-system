package com.example.ticketbookingsystem;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Projections;
import com.mongodb.client.model.Updates;
import org.bson.BsonArray;
import org.bson.BsonString;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
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
    public String getTitle(int id){
        MovieStruct movie =  collection.find(eq("TMDBid", id)).projection(Projections.include("title")).first();
        return movie.title;
    }
    public int insertMovie(int id, List<String> showdates, String showtime, double price) throws IOException {
        tmdbAPI api = new tmdbAPI();
        MovieStruct movie = api.getMovie(id);
        movie.showdates = new ArrayList<>();
        for(String date : showdates) {
            movie.showdates.add(String.format("%s-%s-%s", date.split("-")[2], date.split("-")[0], date.split("-")[1]));
        }
        System.out.println(movie.showdates);
        movie.showtime = showtime;
        movie.price = price;
        if(isExist(movie.TMDBid) == 0){
            collection.insertOne(movie);
            return 0;
        }
        return 1;
    }
    public int isExist(int id){
        MovieStruct movie = collection.find(eq("TMDBid", id)).first();
        if(movie == null)
            return 0;
        return 1;
    }
    public List<String> getDates(String showtime) {
        List<String> showdates = new ArrayList<>();
        FindIterable<MovieStruct> movies = collection.find(eq("showtime", showtime));
        Iterator<MovieStruct> iterator = movies.iterator();
        while(iterator.hasNext()){
            for(String date : iterator.next().showdates){
                if(!showdates.contains(date)){
                    showdates.add(date);
                }
            }
        }
        return showdates;
    }
    public List<MovieStruct> getMovies(){
        FindIterable<MovieStruct> results = collection.find();
        List<MovieStruct> movies = new ArrayList<>();
        Iterator<MovieStruct> iterator = results.iterator();
        while (iterator.hasNext()){
            movies.add(iterator.next());
        }
        return movies;
    }
}