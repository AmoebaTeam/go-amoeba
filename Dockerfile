# Build Geth in a stock Go builder container
FROM golang:1.11-alpine as builder

RUN apk add --no-cache make gcc musl-dev linux-headers

ADD . /go-amoeba_20181114
RUN cd /go-amoeba_20181114 && make geth

# Pull Geth into a second stage deploy alpine container
FROM alpine:latest

RUN apk add --no-cache ca-certificates
COPY --from=builder /go-amoeba_20181114/build/bin/geth /usr/local/bin/

EXPOSE 8545 8546 30303 30303/udp
