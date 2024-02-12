FROM python:3.8-alpine3.13

ARG CLI_VERSION=1.16.312

RUN apk -uv add --no-cache groff jq less && \
    pip install --no-cache-dir awscli==$CLI_VERSION

WORKDIR /aws
