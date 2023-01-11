package com.example.ticketbookingsystem;

import com.mongodb.client.ClientSession;
import com.mongodb.client.MongoCollection;

import static com.mongodb.client.model.Filters.eq;

public class User extends Database{
    private MongoCollection <UserStruct> collection = database.getCollection("users", UserStruct.class);

    public UserStruct getUser(String email) {
        return collection.find(eq("email", email)).first();
    }


}

