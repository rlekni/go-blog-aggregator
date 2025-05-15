package main

import (
	"fmt"
	"log"

	"github.com/rlekni/go-blog-aggregator/internal/config"
)

func main() {
	cfg, err := config.Read()
	if err != nil {
		log.Fatalf("error reading config file: %v", err)
	}
	fmt.Printf("Read config: %+v\n", cfg)

	err = cfg.SetUser("rambo")
	if err != nil {
		log.Fatalf("Couldn't set current user: %v", err)
	}

	cfg, err = config.Read()
	if err != nil {
		log.Fatalf("Error reading config file: %v", err)
	}
	fmt.Printf("Read config: %+v\n", cfg)
}
