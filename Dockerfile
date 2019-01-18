# For development, use alpine in prod
FROM golang:1.11.4

WORKDIR /go/src/app
COPY . .

#RUN go get -d -v ./...
#RUN go install -v ./...
RUN go build -o jide

CMD go build -o jide && ./jide

EXPOSE 3000
