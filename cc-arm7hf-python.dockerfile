#!/usr/bin/env -S docker buildx build . --platform=linux/arm -t local/cc-armv7hf-python -f
# docker run --rm -v $PWD:/app local/cc-armv7hf-python

ARG PYTHON_VERSION=3.11

FROM arm32v7/python:$PYTHON_VERSION-bookworm AS prod

RUN wget https://sh.rustup.rs -O rustup-init.sh && chmod +x rustup-init.sh
RUN ./rustup-init.sh -y --default-toolchain stable-armv7-unknown-linux-gnueabihf

WORKDIR /app

# CMD [ "pip", "wheel", "." ]
ENTRYPOINT [ "/bin/bash" ]
