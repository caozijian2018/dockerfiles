#!/bin/sh
  # 阿里源  
  sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories  && \
  apk upgrade --no-cache \
  && apk add --no-cache \
  musl \
  build-base \
  python3 \
  python3-dev \
  mariadb-dev \
  git \
  gcc \
  make \
  libc-dev \
  linux-headers \
  pcre-dev \
  && pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
  && pip3 install --no-cache-dir --upgrade pip \
  && pip3 install --no-cache-dir uwsgi django==1.11.22 \
  && rm -rf /var/cache/* \
  && rm -rf /root/.cache/* 