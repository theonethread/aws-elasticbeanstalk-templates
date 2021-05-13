package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func main() {
	http.HandleFunc("/", RequestHandler)
	http.HandleFunc("/v1/healthcheck", RequestHandler)
	port := GetEnvDefault("SERVER_PORT", "8000")
	http.ListenAndServe(":"+port, nil)
	log.Printf("Listening on port %s\n", port)
}

func RequestHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello AWS (from Go)!")
}

func GetEnvDefault(key, defVal string) string {
	val, ex := os.LookupEnv(key)
	if !ex {
		return defVal
	}
	return val
}
