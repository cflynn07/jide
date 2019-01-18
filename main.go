package main

import (
	"fmt"
	"log"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "hello 2")
}

func main() {
	fs := http.FileServer(http.Dir("frontend/dist"))
	http.Handle("/", fs)

	http.HandleFunc("/test", handler)

	log.Println("Listening...")
	http.ListenAndServe(":3000", nil)
}
