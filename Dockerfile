ARG CURL_VERSION=8.11.0
ARG ARGO_WF_VERSION=v3.6.2
ARG ARGO_CD_VERSION=v2.13.1
ARG JQ_VERSION=1.7.1
FROM quay.io/curl/curl-base:${CURL_VERSION} as curl
FROM quay.io/argoproj/argocli:${ARGO_WF_VERSION} as argo-wf
FROM quay.io/argoproj/argocd:${ARGO_CD_VERSION} as argo-cd
FROM ghcr.io/jqlang/jq:${JQ_VERSION} as jq

FROM scratch
