package main

import (
	"fmt"
	"os"

	"github.com/stakkato95/continuous-delivery-go/app"
	"github.com/stakkato95/continuous-delivery-go/config"
)

func main() {
	a := app.App{}

	fmt.Printf("APP_DB_USERNAME: %s\n", os.Getenv("APP_DB_USERNAME"))
	fmt.Printf("APP_DB_PASSWORD: %s\n", os.Getenv("APP_DB_PASSWORD"))
	fmt.Printf("APP_DB_NAME: %s\n", os.Getenv("APP_DB_NAME"))
	fmt.Printf("APP_DB_HOST: %s\n", os.Getenv("APP_DB_HOST"))

	config.Init()
	fmt.Printf("APP_DB_HOST config: %s\n", config.AppConfig.PostgresService)

	a.Initialize(
		os.Getenv("APP_DB_USERNAME"),
		os.Getenv("APP_DB_PASSWORD"),
		os.Getenv("APP_DB_NAME"),
		config.AppConfig.PostgresService)

	fmt.Println("server is listeningPPP")
	a.Run(":8010")
}
