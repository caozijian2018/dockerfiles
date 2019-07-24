FROM alpine:3.9
MAINTAINER yangbo
RUN apk upgrade --no-cache \
  && apk add --no-cache \
    musl \
    build-base \
    python3 \
    python3-dev \
    mariadb-dev \
    mariadb-client-libs \
    bash \
    git \
    nginx\
    supervisor\
  && pip3 install --no-cache-dir --upgrade pip \
  && rm -rf /var/cache/* \
  && rm -rf /root/.cache/*

RUN cd /usr/bin \
  && ln -sf python3 python \
  && ln -sf pip3 pip

RUN pip3 install --no-cache-dir uwsgi \
  && rm -rf /var/cache/* \
  && rm -rf /root/.cache/*