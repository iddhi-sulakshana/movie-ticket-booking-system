# Ticket Booking System

### Software Versions

- Intellij Idea Ultimate V.2022.2.4
- JDK 11.0.16
- Apache Tomcat Server 10.0.27
- JakartaEE 9
- Mongodb Driver Sync 4.8.0
- Atlas Mongo Server

## Useful Mongo Code Examples

### Mongo JDBC Dependency
```xml
<dependency>
    <groupId>org.mongodb</groupId>
    <artifactId>mongodb-driver-sync</artifactId>
    <version>${mongodb.version}</version>
</dependency>
```

### Required header files

```java
import com.mongodb.*;
import com.mongodb.client.*;
import org.bson.Document;
```

### Connect to the MongoDatabase
Always close mongo client when no longer needed.
```java
String uri = "mongodb+srv://username:password@clauseter.server.mongodb.net/?retryWrites=true&w=majority";
try(MongoClient mongoClient = MongoClients.create(uri){
    // access a database
    MongoDatabase database = mongoClient.getDatabase("databaseName");
    
    // access a collection
    MongoCollection<Document> collection = database.getCollection("collectionName");
    
    mongoClient.close();
} catch (MongoException ex){
    out(ex.toString());   
}
```

### CRUD Commands for mongodb

```java
// create collection
database.createCollection("CollectionName");

// drop collection
collection.drop();

// Retrieve one data
Document doc = collection.find().first();

// Retrieve more than one data
List<Document> results = new ArrayList<>();
FindIterable<Document> iterable = collection.find();
iterable.into(results);
// Retrueve data using cursor
MongoCursor<Document> cursor = collection.find().cursor();
while(cursor.hasNext()){
    out(cursor.next().toJson());    
}
cursor.close();

// Retrieve limited number of data
FindIterable<Document> iterable = collection.find().limit(4);

// Insert new Document
Document doc = new Document("Title", "Some Title").append("Name", "Someone");
collection.insertOne(doc);
// or get inserted details using
InsertOneResult result = collection.insertOne(doc);
result.getInsertedId().asObjectId().getValue() // returns intered id

// Delete one Document
collection.deleteOne({"Title" : "Some Title"});
// Delete many Documents
collectio.deleteMany({});

// Update one Document
collection.updateOne({"_id": id}, set("Title", "New Title"));
// Update many Document
collection.updateOne({}, inc("Count", 5));
```

### Enable MongoDB Logging

```xml
<dependency>
  <groupId>ch.qos.logback</groupId>
  <artifactId>logback-classic</artifactId>
  <version>1.2.3</version>
</dependency>
```