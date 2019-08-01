FROM python:3.8.0b2-alpine
LABEL MAINTAINER="cy"
RUN mkdir /app && \
  pip3 install flask
EXPOSE 8000
COPY app.py /app/
WORKDIR /app
CMD ["python3", "app.py"]