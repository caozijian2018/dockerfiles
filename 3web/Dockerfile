FROM alpine:3.9
LABEL MAINTAINER=cy
WORKDIR /app
ADD build.sh /build.sh
RUN sh /build.sh
EXPOSE 8000


#  docker run --name=node1 alpine:3.9  sh