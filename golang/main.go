package main

import (
	"fmt"
	"net/http"
	"testproject/api"

	"github.com/kr/pretty"
)

func main() {
	fmt.Println("Hello World")


	client := api.New("http://localhost:1337")
	client.Headers.Set("Authorization", "Bearer testtoken")
	client.Headers.Set("User-Agent", "best client ever")

	u, err := client.Url.Test("123")
	pretty.Println(u.String())
	pretty.Println(err)

	data, err := client.Test("123", api.LelBody{
		Username:        "testuser",
		Password:        "password",
		ConfirmPassword: "password",
	}, api.Options{
		Header: http.Header{
			"User-Agent": {"testing"},
		},
	})

	pretty.Println(err)
	pretty.Println(data)
}
