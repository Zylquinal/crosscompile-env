FROM ubuntu:24.04

ARG SDK_URL

ENV SDK_URL=${SDK_URL}

USER root

COPY setup.sh .

RUN apt update && \
    apt install clang-18 cmake git python3 libssl-dev lzma-dev libxml2-dev xz-utils bzip2 cpio libbz2-dev wget \
    zlib1g-dev llvm-dev uuid-dev clang g++-14-aarch64-linux-gnu libstdc++-14-dev-arm64-cross gcc-14 g++-14 mingw-w64 -y \
    && rm -rf /var/lib/apt/lists/*

RUN bash setup.sh

ENV PATH="/usr/local/osxcross/bin:/usr/local/llvm-mingw/bin:${PATH}"