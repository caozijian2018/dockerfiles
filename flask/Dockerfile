FROM python:3.8
LABEL MAINTAINER="cy"
RUN pip3 install flask
EXPOSE 8000
COPY app /app
WORKDIR /app
CMD ["python3", "managy.py"]