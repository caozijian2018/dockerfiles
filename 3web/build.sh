#!/bin/sh
sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
  && apk upgrade --no-cache \
  && apk add  --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.10/main/ nodejs=10.16.3-r0 \
  && apk add npm \
  && apk add git \
  && apk add python\
  && apk add  openssh --no-cache \
  && npm set sass_binary_site=https://npm.taobao.org/mirrors/node-sass/
  