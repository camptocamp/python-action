FROM ubuntu:24.10
LABEL maintainer Camptocamp "info@camptocamp.com"
SHELL ["/bin/bash", "-o", "pipefail", "-cux"]

ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt

RUN --mount=type=cache,target=/var/cache,sharing=locked \
    --mount=type=cache,target=/root/.cache \
    apt-get update \
    && apt-get dist-upgrade --assume-yes \
    && apt-get install --assume-yes --no-install-recommends software-properties-common dirmngr gpg-agent \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0 \
    && apt-add-repository https://cli.github.com/packages \
    && apt-get install --assume-yes --no-install-recommends python3 python3-requests gh git \
    && apt-get remove --purge --autoremove --assume-yes software-properties-common dirmngr gpg-agent

USER 1001:115
