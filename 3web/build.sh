#!/bin/sh
sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
  && apk upgrade --no-cache \
  && apk add nodejs \
  && apk add npm \
  && apk add git \
  