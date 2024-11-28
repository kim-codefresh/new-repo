# Base image
FROM alpine:3.15.0

# Argo Workflows CLI arguments
ARG ARGO_WORKFLOWS_CLI_VERSION=v3.2.6
ARG TARGETARCH=amd64

# Argo CD CLI argument
ARG ARGOCD_CLI_VERSION=v2.1.7

# Install necessary packages and CLI tools
RUN apk add --no-cache ca-certificates curl jq \
    && curl -sSL -o argo.gz https://github.com/argoproj/argo-workflows/releases/download/$ARGO_WORKFLOWS_CLI_VERSION/argo-linux-${TARGETARCH}.gz \
    && gunzip argo.gz \
    && chmod +x argo \
    && mv argo /usr/local/bin/argo \
    && curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/$ARGOCD_CLI_VERSION/argocd-linux-amd64 \
    && chmod +x /usr/local/bin/argocd
