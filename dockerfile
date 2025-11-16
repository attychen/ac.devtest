# 多阶段 Build 3 个缺失镜像
FROM alpine:3.16 AS kubectl
ARG KUBECTL_VERSION=v1.23.17
RUN apk add --no-cache curl && \
    curl -L https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl

# 用能拉到的 kube-state-metrics 源
FROM docker.io/chengshiwen/kube-state-metrics:v2.3.0 AS ksm-cheng
FROM docker.io/bitnami/kube-state-metrics:2.3.0-debian-11-r0 AS ksm-bitnami
