FROM ubuntu:22.04

ENV \
  DEBIAN_FRONTEND=noninteractive \
  SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt \
  PYTHONIOENCODING=UTF-8 \
  LANG=C.UTF-8 \
  LANGUAGE=C.UTF-8 \
  LC_ALL=C.UTF-8

RUN \
  apt-get update && \
  apt-get install --assume-yes --no-install-recommends software-properties-common dirmngr gpg-agent && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0 && \
  apt-add-repository https://cli.github.com/packages && \
  apt-get install --assume-yes --no-install-recommends python3 python3-requests gh git && \
  apt-get remove --purge --autoremove --assume-yes software-properties-common dirmngr gpg-agent && \
  apt-get clean && \
  rm --recursive --force /var/lib/apt/lists/*

USER 1001:115
