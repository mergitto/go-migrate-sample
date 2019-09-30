FROM golang:1.12.7

RUN mkdir /app

WORKDIR /go/src
COPY . /go/src

ENV GO111MODULE=on

RUN go get github.com/pilu/fresh
CMD ["fresh"]