package main

import (
	"github.com/julienschmidt/httprouter"
	"html/template"
	"log"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
	log.Println("func handler")
	t, err := template.ParseFiles("templates/index.html")
	if err != nil { // if there is an error
		log.Print("template parsing error: ", err) // log it
	}
	err = t.Execute(w, nil)
}

func main() {
	router := httprouter.New()

	router.GET("/", handler)
	router.ServeFiles("/static/*filepath", http.Dir("frontend/dist/"))

	log.Println("Listening 3...")
	http.ListenAndServe(":3000", router)
}
