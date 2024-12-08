# Define versions for tools
ARG CURL_VERSION=8.11.0
ARG ARGO_WF_VERSION=v3.2.6
ARG ARGO_CD_VERSION=v2.13.1
ARG JQ_VERSION=1.7.1

# Pull tools from respective images
FROM quay.io/curl/curl-base:${CURL_VERSION} as curl
FROM quay.io/argoproj/argocli:${ARGO_WF_VERSION} as argo-wf
FROM quay.io/argoproj/argocd:${ARGO_CD_VERSION} as argo-cd
FROM ghcr.io/jqlang/jq:${JQ_VERSION} as jq

# Final stage
FROM debian:latest

# Copy binaries from previous stages
COPY --from=curl /usr/bin/curl /usr/local/bin/curl
COPY --from=argo-wf /bin/argo /usr/local/bin/argo
COPY --from=argo-cd /usr/local/bin/argocd /usr/local/bin/argocd
COPY --from=jq /jq /usr/local/bin/jq

RUN apt-get update && apt-get install -y ca-certificates && \
    chmod +x /usr/local/bin/curl /usr/local/bin/argo /usr/local/bin/argocd /usr/local/bin/jq && \
    apt-get clean


