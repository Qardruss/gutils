package main

import (
	"crypto/sha1"
	"fmt"
	"os"
)

func main() {
	hash := sha1.New()
	toHash := os.Args[1]
	fmt.Printf("%s", hash.Sum([]byte(toHash)))
}
