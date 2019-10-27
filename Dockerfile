FROM alpine:3.10.3
RUN apk update
RUN apk upgrade
RUN apk add curl
