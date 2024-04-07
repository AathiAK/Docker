FROM python:3.9-alpine

WORKDIR /root/Docker

RUN apk update && \
    apk add --no-cache git && \
    git clone https://github.com/AathiAK/Docker.git && \
    cp Docker/hello.py .

CMD ["python3", "hello.py"]

