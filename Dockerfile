FROM gliderlabs/alpine
MAINTAINER Mark Myers <marcusmyers@gmail.com>

ENV PACKER_VERSION 0.8.5

RUN apk-install curl unzip

RUN mkdir /tmp/packer \
    && cd /tmp/packer \
    && curl -O -sS -L https://dl.bintray.com/mitchellh/packer/packer_${PACKER_VERSION}_linux_amd64.zip \
    && unzip packer_${PACKER_VERSION}_linux_amd64.zip \
    && rm packer_${PACKER_VERSION}_linux_amd64.zip \
    && apk del curl unzip \
    && mv packer* /usr/local/bin \
    && cd \
    && rm -rf /tmp/packer \
    && mkdir /app \
    && cd /app

VOLUME /app

# Default command.
CMD ["packer"]


