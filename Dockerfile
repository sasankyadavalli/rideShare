FROM golang:1.21 AS src

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download


COPY . ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /rideShare

EXPOSE 8080

CMD ["/rideShare"]

