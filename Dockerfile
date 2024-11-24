# Base image
FROM alpine:3.15.0

# Argo Workflows CLI arguments
ARG ARGO_WORKFLOWS_CLI_VERSION=v3.2.6
ARG TARGETARCH

# Argo CD CLI argument
ARG ARGOCD_CLI_VERSION=v2.1.7

# Install ca-certificates for secure downloads (optional)
RUN apk add --no-cache ca-certificates

# Install Argo Workflows CLI
RUN wget https://github.com/argoproj/argo-workflows/releases/download/$ARGO_WORKFLOWS_CLI_VERSION/argo-linux-${TARGETARCH}.gz \
    && gunzip argo-linux-${TARGETARCH}.gz \
    && chmod +x argo-linux-${TARGETARCH} \
    && mv ./argo-linux-${TARGETARCH} /usr/local/bin/argo

# Install Argo CD CLI
RUN wget -O /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/$ARGOCD_CLI_VERSION/argocd-linux-amd64 \
    && chmod +x /usr/local/bin/argocd

# Install jq
RUN apk add --no-cache jq

# Install curl
RUN apk add --no-cache curl
