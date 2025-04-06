#!/usr/bin/env -S docker build . -t local/cc-armv7hf-go -f

# docker run --rm -v $PWD:/app local/cc-armv7hf-go

FROM golang:1.24

RUN apt-get update && \
    apt-get install -y crossbuild-essential-armhf && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

ENV GOOS=linux  
ENV GOARCH=arm

CMD [ "go", "build", "-o", "out_arm7hf" ]
# CMD [ "go", "build", "-o", "out_arm7hf", "./cmd" ]
