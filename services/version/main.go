/*
 license x
*/

package main

import (
	"log"
)

var (
	version string
	build   string
)

func main() {
	log.Default().Println("version=", version)
	log.Default().Println("build=", build)
}
