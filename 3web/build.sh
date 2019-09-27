#!/bin/sh
# sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
sed -i /etc/apk/repositories \
  && apk upgrade --no-cache \
  && apk add nodejs \
  && apk add npm \
  && apk add git \
  