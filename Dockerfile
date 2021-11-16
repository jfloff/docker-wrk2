FROM debian:11-slim

RUN set -ex ;\
  apt-get update ;\
  apt-get install -y --no-install-recommends ${BUILD_DEPS} ;\
  rm -rf /var/lib/apt/lists/*

RUN set -ex ;\
    apt-get update ;\
    apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        libssl-dev \
        libz-dev \
        git ;\
    rm -rf /var/lib/apt/lists/*

RUN set -ex ;\
    git clone https://github.com/giltene/wrk2.git /tmp/wrk2 ;\
    cd /tmp/wrk2 ;\
    make ;\
    mv wrk /usr/bin/