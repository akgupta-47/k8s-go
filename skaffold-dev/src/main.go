package main

import (
	"log"
	"net/http"
)

func main() {

	log.Println("starting server")
	
	http.HandleFunc("/", handler)
	http.ListenAndServe(":8000", nil)
}

func handler(w http.ResponseWriter, r *http.Request) {
	log.Printf("request received")
	w.Write([]byte("Hello from Go server"))
}
