FROM python:alpine

# using same aws-cli that was used before moving to quay images to prevent regressions
ARG CLI_VERSION=1.18.188

RUN apk -uv add --no-cache groff jq less && \
    pip install --no-cache-dir awscli==$CLI_VERSION

WORKDIR /aws
