package main

import (
	"encoding/base64"
	"fmt"
	"os"
)

func main() {
	encoded := base64.StdEncoding.EncodeToString([]byte(os.Args[1]))
	fmt.Println(string(encoded))
}
