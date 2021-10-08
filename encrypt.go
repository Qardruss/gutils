package main

import (
	"bytes"
	"compress/zlib"
	"fmt"
	"os"
)

func main() {
	var b bytes.Buffer
	w := zlib.NewWriter(&b)
	w.Write([]byte(os.Args[1]))
	w.Close()
	fmt.Println(b.String())
}
