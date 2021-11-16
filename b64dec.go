package main

import (
	"encoding/base64"
	"fmt"
	"os"
)

func main() {
	sDec, err := base64.StdEncoding.DecodeString(os.Args[1])
	if err != nil {
		fmt.Printf("Error decoding string: %s ", err.Error())
		return
	}

	fmt.Println(string(sDec))
}
