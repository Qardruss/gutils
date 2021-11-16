package main

import (
	"fmt"
	"io/fs"
	"io/ioutil"
	"os"
)

func main() {
	if !fs.ValidPath(os.Args[1]) {
		fmt.Println("dog: not valid path")
		return
	}
	filetoread := os.Args[1]
	content, err := ioutil.ReadFile(filetoread)
	if err != nil {
		fmt.Println("dog: unknown error")
		return
	}
	fmt.Println(string(content))
}
