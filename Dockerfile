FROM alpine:latest

RUN apk update && apk upgrade && \
    apk add --no-cache bash git coreutils

RUN git clone https://github.com/redian23/console-fishing.git

WORKDIR /console-fishing

ENTRYPOINT ["/console-fishing/./fishing"]