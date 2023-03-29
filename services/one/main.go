/*
 license x
*/

package main

import (
	"net/http"

	echo "github.com/labstack/echo/v4"
	"github.com/nelsonstr/demo-monorepo/libs/hello"
)

func main() {
	e := echo.New()
	e.GET("/one/hello", func(c echo.Context) error {
		return c.String(http.StatusOK, hello.Greet("Hello, World!"))
	})
	_ = e.Start(":8080")
}
