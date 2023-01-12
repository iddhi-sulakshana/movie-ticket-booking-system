package com.example.ticketbookingsystem;

import com.mongodb.client.*;
import org.bson.codecs.configuration.CodecProvider;
import org.bson.codecs.configuration.CodecRegistry;
import org.bson.codecs.pojo.PojoCodecProvider;

import static com.mongodb.MongoClientSettings.getDefaultCodecRegistry;
import static org.bson.codecs.configuration.CodecRegistries.fromProviders;
import static org.bson.codecs.configuration.CodecRegistries.fromRegistries;

class Database {
    private String dbName = "ABCdb";
    private String uri = "mongodb+srv://admin:1234@abc-cinema-cluster.zml2mzp.mongodb.net/?retryWrites=true&w=majority";
    private MongoClient mongoClient = null;
    private CodecProvider pojoCodecProvider = PojoCodecProvider.builder().automatic(true).build();
    private CodecRegistry pojoCodecRegistry = fromRegistries(getDefaultCodecRegistry(), fromProviders(pojoCodecProvider));
    protected MongoDatabase database = null;
    public Database() {
        mongoClient = MongoClients.create(uri);
        database = mongoClient.getDatabase(dbName).withCodecRegistry(pojoCodecRegistry);
    }
    public void close(){
        mongoClient.close();
        database = null;
    }
}
