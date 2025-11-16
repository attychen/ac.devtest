# 1. 官方 kubectl 直链
FROM alpine:3.16 AS kubectl
ARG KUBECTL_VERSION=v1.23.17
RUN apk add --no-cache curl && \
    curl -fsSL https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl

# 2. 官方 kube-state-metrics 直链（GitHub Release）
FROM alpine:3.16 AS ksm
ARG KSM_VERSION=v2.3.0
RUN apk add --no-cache curl && \
    curl -fsSL https://github.com/kubernetes/kube-state-metrics/releases/download/${KSM_VERSION}/kube-state-metrics-${KSM_VERSION}-linux-amd64.tar.gz | \
    tar -xz -C /usr/local/bin --strip-components=1 && \
    chmod +x /usr/local/bin/kube-state-metrics
ENTRYPOINT ["/usr/local/bin/kube-state-metrics"]
