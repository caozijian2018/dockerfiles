FROM alpine:3.9
MAINTAINER cy
COPY app /app
WORKDIR /app
ADD build.sh /build.sh
RUN sh /build.sh
EXPOSE 8000

CMD ["python3", "test.py"]

