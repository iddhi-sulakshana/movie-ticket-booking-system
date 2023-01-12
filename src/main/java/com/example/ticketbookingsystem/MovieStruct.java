package com.example.ticketbookingsystem;


import java.util.Date;
import java.util.List;

public class MovieStruct {
    public int          TMDBid;
    public String       title;
    public List<String> genres;
    public String       poster;
    public String       banner;
    public List<Date> showdates;
    public String       showtime;
    public String       description;
    @Override
    public String toString() {
        return String.format("TMDBid:\t%d\ntitle:\t%s\ngenres:\t%s\nposter:\t%s\nbanner:\t%s\nshowdates:\t%s\nshowtime:\t%s\ndescription:\t%s\n",
                TMDBid,title, genres,poster,banner,showdates,showtime, description);
    }
}
