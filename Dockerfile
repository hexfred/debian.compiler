FROM     debian:jessie
MAINTAINER hexfred

# Install compiler and user to compile
USER root
RUN \
    apt-get update -y && \
    apt-get install -y build-essential git zlib1g-dev golang wget autoconf && \
    useradd -m -s /bin/bash bob && \
    mkdir /home/bob/src

#USER bob
WORKDIR /home/bob/src
