# For development, use alpine in prod
FROM golang:1.11.4-alpine3.8 as builder
WORKDIR /go/src/app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM alpine:latest
WORKDIR /root
COPY --from=builder /go/src/app/main .
COPY --from=builder /go/src/app/frontend /root/frontend
COPY --from=builder /go/src/app/templates /root/templates
CMD ["./main"]
