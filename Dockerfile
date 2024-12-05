# Define versions for tools
ARG CURL_VERSION=8.11.0
ARG ARGO_WF_VERSION=v3.6.2
ARG ARGO_CD_VERSION=v2.13.1
ARG JQ_VERSION=1.7.1

# Pull tools from respective images
FROM quay.io/curl/curl-base:${CURL_VERSION} as curl
FROM quay.io/argoproj/argocli:${ARGO_WF_VERSION} as argo-wf
FROM quay.io/argoproj/argocd:${ARGO_CD_VERSION} as argo-cd
FROM ghcr.io/jqlang/jq:${JQ_VERSION} as jq

# Final stage
FROM alpine:latest

# Copy binaries from previous stages
COPY --from=curl /usr/bin/curl /usr/bin/curl
COPY --from=argo-wf /bin/argo /bin/argo
COPY --from=argo-cd /bin/argocd /bin/argocd
COPY --from=jq /usr/bin/jq /usr/bin/jq

# Set up minimal environment
RUN apk add --no-cache ca-certificates && \
    chmod +x /usr/bin/curl /usr/local/bin/argo /usr/local/bin/argocd /usr/local/bin/jq


