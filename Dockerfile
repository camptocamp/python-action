FROM ubuntu:26.04
LABEL org.opencontainers.image.authors="Camptocamp <info@camptocamp.com>"
SHELL ["/bin/bash", "-o", "pipefail", "-cux"]

ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt

RUN --mount=type=cache,target=/var/cache,sharing=locked \
    --mount=type=cache,target=/root/.cache \
    apt-get update \
    && apt-get dist-upgrade --assume-yes \
    && apt-get install --assume-yes --no-install-recommends ca-certificates curl \
    && curl --fail --silent --show-error --location https://cli.github.com/packages/githubcli-archive-keyring.gpg \
        --output /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
        > /etc/apt/sources.list.d/github-cli.list \
    && apt-get update \
    && apt-get install --assume-yes --no-install-recommends python3 python3-requests gh git

USER 1001:115
