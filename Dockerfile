FROM docker:18.06 as static-docker-source
FROM node:10-alpine

COPY --from=static-docker-source /usr/local/bin/docker /usr/local/bin/docker

# Adds docker-compose to the image
RUN apk add --no-cache py-pip python-dev libffi-dev openssl-dev gcc libc-dev make \
    && pip install --upgrade pip \
    && pip install cffi docker-compose \
    && apk add --no-cache ca-certificates
