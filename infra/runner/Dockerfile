FROM ubuntu:22.04
RUN apt-get update && \
    apt-get -y install apt-transport-https \
    ca-certificates \
    curl \
    tar \
    jq \
    build-essential \
    gnupg2 \
    iputils-ping \
    software-properties-common \
    zip \
    unzip \
    git

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" && \
    apt-get update && \
    apt-get -y install docker-ce

WORKDIR /runner
COPY scripts/* .
RUN chmod +x build.sh cleanup.sh entrypoint.sh health-check.sh && \
    ./build.sh && \
    useradd -d /runner -G docker -M ghrunner && \
    chown -R ghrunner: /runner
USER ghrunner

ENTRYPOINT ["/runner/entrypoint.sh"]

HEALTHCHECK --start-period=30s CMD ["/runner/health-check.sh"]
