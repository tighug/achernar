FROM debian:buster-slim AS development
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN mkdir -p /usr/share/man/man1 /usr/share/man/man2
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    exa \
    git \
    graphviz \
    openjdk-11-jre \
    vim \
    zsh \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*
RUN curl -LJO https://github.com/sharkdp/bat/releases/download/v0.17.1/bat_0.17.1_amd64.deb \
    && dpkg -i bat_0.17.1_amd64.deb \
    && rm bat_0.17.1_amd64.deb
RUN curl -fsSL https://starship.rs/install.sh | bash -s - -y