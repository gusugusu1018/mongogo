FROM golang:1.13-alpine as builder

RUN apk update && apk add --no-cache git gcc libc-dev
RUN go get -u github.com/golang/dep/cmd/dep
COPY ./src/api ./src/api
WORKDIR /go/src/api
RUN dep ensure
RUN go install

FROM golang:1.13-alpine

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.5.0/wait /wait
RUN chmod +x /wait

COPY --from=builder /go/bin/api /go/bin/api
WORKDIR /go/bin

CMD /wait && ./api
