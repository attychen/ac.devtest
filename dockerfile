# 1. 官方 kubectl（GitHub 可拉）
FROM alpine:3.16 AS kubectl
ARG KUBECTL_VERSION=v1.23.17
RUN apk add --no-cache curl && \
    curl -L https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl

# 2. 南大镜像站 kube-state-metrics（GitHub 可拉）
FROM quay.nju.edu.cn/coreos/kube-state-metrics:v2.3.0 AS ksm-nju
