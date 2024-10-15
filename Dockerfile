# Use a lightweight base image
FROM alpine:3.16

# Install necessary dependencies
RUN apk add --no-cache curl bash

# Set the versions for Argo CD CLI and Argo Workflows CLI
ARG ARGOCD_VERSION=2.6.4
ARG ARGOWORKFLOWS_VERSION=3.4.6

# Install Argo CD CLI
RUN curl -sSL "https://github.com/argoproj/argo-cd/releases/download/v${ARGOCD_VERSION}/argocd-linux-amd64" -o /usr/local/bin/argocd && \
    chmod +x /usr/local/bin/argocd

# Install Argo Workflows CLI
RUN curl -sSL "https://github.com/argoproj/argo/releases/download/v${ARGOWORKFLOWS_VERSION}/argo-linux-amd64" -o /usr/local/bin/argo && \
    chmod +x /usr/local/bin/argo

# Set the entry point to a shell
ENTRYPOINT ["/bin/bash"]
