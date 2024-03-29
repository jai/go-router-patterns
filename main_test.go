package main

import (
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGinPingRoute(t *testing.T) {
	router := setupGinRouter()

	w := httptest.NewRecorder()
	req, _ := http.NewRequest("GET", "/gin/ping", nil)
	router.ServeHTTP(w, req)

	assert.Equal(t, http.StatusOK, w.Code)
	assert.Equal(t, "pong", w.Body.String())
}