# Build Stage
FROM golang:1.12.7-alpine AS builder

#ADD . /app
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

WORKDIR $GOPATH/src/github.com/jai/go-router-patterns
COPY . .
RUN go get -d -v ./...

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o /main .


# Final stage
FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=builder /main ./
RUN chmod +x ./main
ENTRYPOINT ["./main"]
EXPOSE 8080