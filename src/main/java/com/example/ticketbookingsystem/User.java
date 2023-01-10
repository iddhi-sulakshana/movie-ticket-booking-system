package com.example.ticketbookingsystem;

import com.mongodb.client.MongoCollection;

public class User extends Database{
    private MongoCollection<UserStruct> collection = database.getCollection("users", UserStruct.class);
}
