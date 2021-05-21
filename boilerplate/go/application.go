package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func main() {
	http.HandleFunc("/<<HEALTH-CHECK-PATH>>/", RequestHandler)
	http.HandleFunc("/<<APPLICATION>>/", RequestHandler)
	port := GetEnvDefault("SERVER_PORT", "8000")
	log.Printf("Will listen on port %s\n", port)
	http.ListenAndServe(":"+port, nil)
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
