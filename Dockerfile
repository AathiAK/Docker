FROM python:3.9-alpine

WORKDIR /app

RUN apk update && \
    apk add --no-cache git && \
    git clone https://github.com/AathiAK/Docker.git

CMD ["python3", "hello.py"]

