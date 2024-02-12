FROM python:3.9-alpine

ARG CLI_VERSION=1.16.312

RUN apk -uv add --no-cache groff jq less && \
    pip install --no-cache-dir awscli==$CLI_VERSION urllib3 six

WORKDIR /aws

CMD sh
