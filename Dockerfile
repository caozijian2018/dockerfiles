FROM alpine:3.8
MAINTAINER yangbo
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
  && apk upgrade --no-cache \
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
  && pip3 install --no-cache-dir mysql- \

  && rm -rf /var/cache/* \
  && rm -rf /root/.cache/* \
  && cd /usr/bin \
  && ln -sf python3 python \
  && ln -sf pip3 pip \
  && pip3 install --no-cache-dir uwsgi \
  && rm -rf /var/cache/* \
  && rm -rf /root/.cache/*
EXPOSE 8000
COPY app /app
WORKDIR /app
CMD ["python3", "managy.py"]