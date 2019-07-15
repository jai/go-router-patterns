## Go Routers and Containerization - Proof of Concept

#### Objectives
* Demo various Go router/mux patterns
* Test containerization + orchestration with Kubernetes

**Go routers/muxes:**
* Gin (done)
* Gorilla (not started)
* Other (not started)
  * https://blog.merovius.de/2017/06/18/how-not-to-use-an-http-router.html
  * https://medium.com/statuscode/how-i-write-go-http-services-after-seven-years-37c208122831

**Containerization methods:**
* Plain Docker image `docker build .` using current Dockerfile (done)
* Native Kubernetes deployment (in progress)
* Kubernetes via Terraform -https://www.terraform.io/ (not started)