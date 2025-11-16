# 多阶段一次性 Build 3 个缺失镜像
FROM alpine:3.16 AS kubectl
ARG KUBECTL_VERSION=v1.23.17
RUN apk add --no-cache curl && \
    curl -L https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl

FROM registry.cn-beijing.aliyuncs.com/prometheus/kube-state-metrics:v2.3.0 AS ksm-prom
FROM quay.nju.edu.cn/coreos/kube-state-metrics:v2.3.0 AS ksm-quay
