FROM caocaocao/web
LABEL MAINTAINER=cy
COPY ./deploy_auto.sh /app/deploy_auto.sh
WORKDIR /app
RUN apk add python\
    && apk add  openssh --no-cache\
    && npm set sass_binary_site=https://npm.taobao.org/mirrors/node-sass/\