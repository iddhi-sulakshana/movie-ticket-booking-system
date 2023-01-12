package com.example.ticketbookingsystem;


import java.io.IOException;
import java.net.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;
import com.google.gson.*;

public class tmdbAPI {
    private String secret = "?api_key=2d3459d7ac51ad63c92de5ae6fdefad4";
    private String apiUrl = "https://api.themoviedb.org/3/";
    private String searchApi = String.format("%ssearch/movie%s&language=en-US", apiUrl, secret);
    public int searchMovie(String searchQuery) throws IOException {
        String requestUrl = String.format("%s&query=%s&page=1&include_adult=false", searchApi, searchQuery.replace(" ", "%20"));
        String response = getResponse(requestUrl);
        if(response.contains("HTTPResponseCode:")) {
            throw new RuntimeException(response);
        }
        JsonParser parser = new JsonParser();
        JsonObject rootObj = parser.parse(response).getAsJsonObject();
        JsonArray results = rootObj.get("results").getAsJsonArray();
        Iterator<JsonElement> iterator = results.iterator();
        int id = -1;
        while(iterator.hasNext()){
            JsonObject obj = iterator.next().getAsJsonObject();
            id = obj.get("id").getAsInt();
            break;
        }
        return id;
    }
    public MovieStruct getMovie(int movieId) throws IOException {
        if(movieId <= 0) {
            System.out.println(movieId);
            throw new RuntimeException("Incorrect movie id");
        }
        String requestUrl  = String.format("%smovie/%d%s&language=en-US", apiUrl, movieId, secret);
        String response = getResponse(requestUrl);
        if(response.contains("HTTPResponseCode:")) {
            throw new RuntimeException(response);
        }
        JsonParser parser = new JsonParser();
        JsonObject rootObj = parser.parse(response).getAsJsonObject();
        MovieStruct movie = new MovieStruct();
        movie.TMDBid = rootObj.get("id").getAsInt();
        movie.title = rootObj.get("original_title").getAsString();
        movie.poster = rootObj.get("poster_path").getAsString();
        movie.banner = rootObj.get("backdrop_path").getAsString();
        movie.genres = new ArrayList<>();
        movie.description = rootObj.get("overview").getAsString();
        JsonArray genres = rootObj.get("genres").getAsJsonArray();
        Iterator<JsonElement> iterator = genres.iterator();
        while(iterator.hasNext()){
            JsonObject genre = parser.parse(String.valueOf(iterator.next())).getAsJsonObject();
            movie.genres.add(genre.get("name").getAsString());
        }
        return movie;
    }
    private String getResponse(String requestUrl) throws IOException {
        URL url = new URL(requestUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.connect();
        String response = "";
        if(conn.getResponseCode() != 200){
            response = "HTTPResponseCode: " + conn.getResponseCode();
            return response;
        }
        Scanner scanner = new Scanner(url.openStream());
        while(scanner.hasNext()){
            response += scanner.nextLine();
        }
        scanner.close();
        return response;
    }
}
