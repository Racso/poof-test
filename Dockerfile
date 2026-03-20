FROM golang:1.24-alpine AS builder
WORKDIR /app
COPY main.go .
RUN go mod init poof-test && go build -o server .

FROM alpine:latest
COPY --from=builder /app/server /server
EXPOSE 8080
CMD ["/server"]
