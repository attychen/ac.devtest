FROM alpine:3.16
ARG KUBECTL_VERSION=v1.23.17
RUN apk add --no-cache curl && \
    curl -L https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl
ENTRYPOINT ["kubectl"]
