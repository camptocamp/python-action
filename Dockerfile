FROM ubuntu:18.04

ENV \
  DEBIAN_FRONTEND=noninteractive \
  SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt \
  PYTHONIOENCODING=UTF-8

RUN \
  apt-get update && \
  apt-get install --assume-yes --no-install-recommends git python3 python3-requests  && \
  apt-get clean && \
  rm --recursive --force /var/lib/apt/lists/*

USER 1001:115
