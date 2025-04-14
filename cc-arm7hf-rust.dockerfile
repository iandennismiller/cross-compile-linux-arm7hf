#!/usr/bin/env -S docker buildx build . --platform=linux/arm -t local/cc-armv7hf-rust -f
# docker run --rm -v $PWD:/app local/cc-armv7hf-rust

FROM arm32v7/rust:1.86-bookworm

RUN rustup toolchain install stable-armv7-unknown-linux-gnueabihf

WORKDIR /app
  
CMD [ "cargo", "build", "--release" ]
