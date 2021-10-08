package main

import (
	"encoding/base64"
	"fmt"
	"os"
)

func main() {
	decoder := base64.NewDecoder(base64.StdEncoding, os.Stdout)
	decoder.Read([]byte(os.Args[1]))
	fmt.Println(":: gutils b64go ::")
}
