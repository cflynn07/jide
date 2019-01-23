# For development, use alpine in prod
FROM golang:1.11.4-alpine3.8 as builder
WORKDIR /go/src/app
COPY ./vendor ./vendor
COPY ./main.go main.go
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM alpine:latest
WORKDIR /root
COPY --from=builder /go/src/app/main .
COPY ./frontend /root/frontend
COPY ./templates /root/templates
CMD ["./main"]
