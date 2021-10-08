package main

import (
	"encoding/base64"
	"fmt"
	"os"
)

func main() {
	input := []byte(os.Args[1])
	encoder := base64.NewEncoder(base64.StdEncoding, os.Stdout)
	encoder.Write(input)
	encoder.Close()
	fmt.Print("\n")
	fmt.Println(":: ENCODED WITH B64GO ::")
}
