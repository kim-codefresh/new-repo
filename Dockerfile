FROM python:3.8-alpine

ARG CLI_VERSION=1.16.312

# Set Python version explicitly
RUN apk add --no-cache python3=3.8.0 \
    && ln -sf python3 /usr/bin/python \
    && ln -sf pip3 /usr/bin/pip \
    && apk -uv add --no-cache groff jq less \
    && pip install --no-cache-dir awscli==$CLI_VERSION

WORKDIR /aws
