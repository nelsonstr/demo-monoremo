/*
 license x
*/

package main

import (
	"net/http"

	echo "github.com/labstack/echo/v4"

	"github.com/nelsonstr/monorepo/libs/hello"
)

func main() {
	e := echo.New()
	e.GET("/two/hello", func(c echo.Context) error {
		return c.String(http.StatusOK, hello.Greet("Friend"))
	})
	_ = e.Start(":8080")
}
