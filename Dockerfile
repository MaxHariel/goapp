FROM golang:1.17-alpine AS builder

WORKDIR /usr/app

COPY main.go /usr/app/
COPY go.mod /usr/app/

RUN go build

FROM scratch

COPY --from=builder /usr/app/goapp /usr/app/goapp

CMD ["/usr/app/goapp"]