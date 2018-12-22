# Build Geth in a stock Go builder container
FROM golang:1.11-alpine as builder

RUN apk add --no-cache make gcc musl-dev linux-headers

ADD . /go-amoeba
RUN cd /go-amoeba && make geth

# Pull Geth into a second stage deploy alpine container
FROM alpine:latest

RUN apk add --no-cache ca-certificates
COPY --from=builder /go-amoeba/build/bin/geth /usr/local/bin/

EXPOSE 8396 8397 21394 21394/udp
ENTRYPOINT ["geth"]
