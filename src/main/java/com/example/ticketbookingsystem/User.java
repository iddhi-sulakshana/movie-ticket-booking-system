package com.example.ticketbookingsystem;

import com.mongodb.client.ClientSession;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;
import org.bson.types.ObjectId;

import static com.mongodb.client.model.Filters.eq;

public class User extends Database{
    private MongoCollection <UserStruct> collection = database.getCollection("users", UserStruct.class);

    public UserStruct getUser(String email) {
        return collection.find(eq("email", email)).first();
    }
    public UserStruct getUser(ObjectId _id) {
        return collection.find(eq("_id", _id)).first();
    }
    public void createUser(UserStruct user){
        collection.insertOne(user);
    }
    public void deleteUser(ObjectId _id){
        collection.findOneAndDelete(eq("_id", _id));
    }
    public void updateUser(UserStruct update){
        collection.findOneAndUpdate(eq("_id", update._id), Updates.combine(
                Updates.set("password", update.password),
                Updates.set("fullName", update.fullName)
        ));
    };
    public int isExistEmail(String email){
        UserStruct found = collection.find(eq("email", email)).first();
        if(found != null)
            return 1;
        return 0;
    }
    public int isExistPhone(String phone){
        UserStruct found = collection.find(eq("phone", phone)).first();
        if(found != null)
            return 1;
        return 0;
    }
}

