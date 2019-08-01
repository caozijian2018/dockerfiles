#!/bin/sh
sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
  && apk upgrade --no-cache \
  && apk add --no-cache \
  node \
  && rm -rf /var/cache/* \
  && rm -rf /root/.cache/*
  