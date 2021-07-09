FROM alpine:3.8

RUN apk update && apk upgrade && \
    apk add --no-cache bash git 

RUN git clone https://github.com/redian23/console-fishing.git
WORKDIR /console-fishing
ENTRYPOINT ["/console-fishing/./fishing"]