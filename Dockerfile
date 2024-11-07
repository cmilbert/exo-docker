FROM nvidia/cuda:12.6.2-cudnn-devel-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=America/New_York

RUN apt-get update && apt-get install -y --no-install-recommends git bash python3-venv python3-pip python3-dev \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/exo-explore/exo.git /exo

WORKDIR /exo

RUN  pip install --no-cache-dir -e . && \
     /bin/bash install.sh

CMD ["/usr/local/bin/exo"]
