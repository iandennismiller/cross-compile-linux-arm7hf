#!/usr/bin/env docker build -f cc-rust-arm7hf.dockerfile -t local/cross-compile-rust-armv7hf .
# docker run --rm -v $PWD:/app local/cross-compile-armv7hf

FROM rust:1.85.1-bookworm
 
RUN apt update && apt upgrade -y 
RUN apt install -y g++-arm-linux-gnueabihf libc6-dev-armhf-cross
 
RUN rustup target add armv7-unknown-linux-gnueabihf 
RUN rustup toolchain install --force-non-host stable-armv7-unknown-linux-gnueabihf

WORKDIR /app
 
ENV CARGO_TARGET_ARMV7_UNKNOWN_LINUX_GNUEABIHF_LINKER=arm-linux-gnueabihf-gcc CC_armv7_unknown_Linux_gnueabihf=arm-linux-gnueabihf-gcc CXX_armv7_unknown_linux_gnueabihf=arm-linux-gnueabihf-g++
 
CMD ["cargo", "build", "--release", "--locked", "--target", "armv7-unknown-linux-gnueabihf"]
