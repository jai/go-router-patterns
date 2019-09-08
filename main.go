package main

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

// Using Gin
func setupGinRouter() *gin.Engine {
	r := gin.Default()

	r.GET("/gin/ping", func(c *gin.Context) {
		c.String(http.StatusOK, "pong")
	})

	return r
}

func main() {
	r := setupGinRouter()
	_ = r.Run(":8080")
}
