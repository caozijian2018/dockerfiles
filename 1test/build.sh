#!/bin/sh
sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
  && apk upgrade --no-cache \
  && apk add --no-cache \
  musl \
  build-base \
  python3 \
  python3-dev \
  mariadb-dev \
  bash \
  git \
  nginx \
  && pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
  && pip3 install --no-cache-dir --upgrade pip \
  && apk add --no-cache gcc make libc-dev linux-headers pcre-dev \
  && pip3 install --no-cache-dir uwsgi \
  && pip3 install -r /app/requirements.txt \
  && rm -rf /var/cache/* \
  && rm -rf /root/.cache/*
  