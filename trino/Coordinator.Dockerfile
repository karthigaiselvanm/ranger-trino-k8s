FROM ubuntu:20.04

# trino version will be passed in at build time
ARG TRINO_VERSION=426

RUN apt-get update && \
    apt-get install -y wget curl openjdk-17-jdk-headless python-is-python3 less && \
    apt-get clean

ENTRYPOINT /etc/trino/docker-entrypoint-coordinator.sh