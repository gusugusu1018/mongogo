package main
import (
    "context"
    "fmt"
    "log"
    "go.mongodb.org/mongo-driver/mongo"
)

func main() {
    // Rest of the code will go here
    client, err := mongo.Connect(context.TODO(), "mongodb://localhost:27017")
    if err != nil {
        log.Fatal(err)
    }
    // Check the connection
    err = client.Ping(context.TODO(), nil)
    if err != nil {
        log.Fatal(err)
    }
    fmt.Println("Connected to MongoDB!")
}