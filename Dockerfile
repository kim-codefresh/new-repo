FROM python:3.10-alpine

ARG CLI_VERSION=1.16.312

RUN apk -uv add --no-cache groff jq less && \
    pip install --no-cache-dir awscli==$CLI_VERSION

WORKDIR /aws

CMD sh
