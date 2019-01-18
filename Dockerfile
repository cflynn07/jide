FROM golang:1.11.4-alpine3.8

WORKDIR /go/src/app
COPY . .

RUN go get -d -v ./...
RUN go install -v ./...
RUN go build -o jide

EXPOSE 3000

CMD ["./jide"]
