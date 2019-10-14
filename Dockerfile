FROM node:10-alpine

# Adds docker-compose to the image
RUN apk add --no-cache py-pip python-dev libffi-dev openssl-dev gcc libc-dev make && pip install --upgrade pip && pip install cffi docker-compose
