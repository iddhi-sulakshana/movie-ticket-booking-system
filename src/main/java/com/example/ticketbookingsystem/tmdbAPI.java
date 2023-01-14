package com.example.ticketbookingsystem;


import java.io.IOException;
import java.net.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
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

    public MovieDetails getMovieDetails(String id) throws IOException {

        MovieDetails movie = new MovieDetails();

        String tmdbmovieId = id;

        String requestUrl1 = "https://api.themoviedb.org/3/movie/" + tmdbmovieId + secret;
        String requestUrl2 = "https://api.themoviedb.org/3/movie/" + tmdbmovieId + "/credits" + secret ;
        String requestUrl3 = "https://api.themoviedb.org/3/movie/" + tmdbmovieId + "/reviews" + secret;

        String response = getResponse(requestUrl2);
        String response2 = getResponse(requestUrl3);
        String response3 = getResponse(requestUrl1);
        if(response.contains("HTTPResponseCode:")) {
            throw new RuntimeException(response);
        }

        JsonParser parser = new JsonParser();
        JsonObject rootObj = parser.parse(response).getAsJsonObject();
        JsonObject rootObj2 = parser.parse(response2).getAsJsonObject();
        JsonObject rootObj3 = parser.parse(response3).getAsJsonObject();

        movie.imdbID = rootObj3.get("imdb_id").getAsString();


        JsonArray crew = rootObj.get("crew").getAsJsonArray();
        String director = "";
        for (JsonElement element : crew) {
            JsonObject obj = element.getAsJsonObject();
            if (obj.get("job").getAsString().equals("Director")) {
                director = obj.get("name").getAsString();
                break;
            }
        }

        JsonArray cast = rootObj.get("cast").getAsJsonArray();
        List<String> castActor = new ArrayList<>();
        List<String> castCharacter = new ArrayList<>();
        List<String> castProfile = new ArrayList<>();

        int castCounter = 0;
        for (JsonElement element : cast) {
            if (castCounter < 10) {
                castActor.add(element.getAsJsonObject().get("name").getAsString());
                castCharacter.add(element.getAsJsonObject().get("character").getAsString());
                castProfile.add(element.getAsJsonObject().get("profile_path").getAsString());
                castCounter++;
            } else {
                break;
            }
        }
        String[] actorArr = castActor.toArray(new String[castActor.size()]);
        String[] characterArr = castCharacter.toArray(new String[castCharacter.size()]);
        String[] actorProfileArr = castProfile.toArray(new String[castProfile.size()]);

        JsonArray reviewsNode = rootObj2.get("results").getAsJsonArray();
        String reviewAuthor = "";
        String reviewContent ="";
        String reviewDateTime = "";
        String reviewRating = "";

        if (reviewsNode.size() > 0) {
            JsonElement firstReviewNode = reviewsNode.get(0);
            reviewAuthor = firstReviewNode.getAsJsonObject().get("author").getAsString();
            reviewContent = firstReviewNode.getAsJsonObject().get("content").getAsString();
            reviewDateTime = firstReviewNode.getAsJsonObject().get("created_at").getAsString();
            JsonElement rating = firstReviewNode.getAsJsonObject().get("author_details").getAsJsonObject().get("rating");
            if (rating != null && !rating.isJsonNull()) {
                reviewRating = rating.getAsString();
            } else {
                reviewRating = "null";
            }
        }

        String reviewTitle = "";
        String reviewBody = "";
        String reviewDate = "";

        if(reviewContent.length() > 0) {
            reviewDate = reviewDateTime.substring(0,10);

            if(reviewContent.indexOf("*") >= 0) {
                int startIndex = reviewContent.indexOf("*");
                int endIndex;
                reviewTitle = "";
                reviewBody = "";

                if(startIndex == 0){
                    endIndex = reviewContent.indexOf("*", startIndex + 2);
                    reviewTitle= reviewContent.substring(startIndex + 2, endIndex);
                    String ellipsis = "...";
                    String newString = reviewContent.substring(endIndex + 2, endIndex + 550);
                    reviewBody = newString + ellipsis;
                } else {
                    endIndex = 0;
                    String ellipsis = "...";
                    String newString = reviewContent.substring(endIndex, endIndex + 550);
                    reviewBody = newString + ellipsis;
                }
            } else {
                int startIndex = 0;
                int endIndex;
                reviewTitle = "";
                reviewBody = "";

                String ellipsis = "...";
                String newString = reviewContent.substring(startIndex);
                reviewBody = newString + ellipsis;

            }

        }



        movie.director = director;

        movie.actorName = actorArr;
        movie.characterName = characterArr;
        movie.profilePath = actorProfileArr;

        movie.author = reviewAuthor;

        movie.reviewTitle = reviewTitle;

        movie.reviewBody = reviewBody;

        movie.reviewDate = reviewDate;

        movie.reviewRating = reviewRating;


        return movie;


    }

}
