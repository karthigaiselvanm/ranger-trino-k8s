FROM ubuntu:20.04

# trino version will be passed in at build time
ARG TRINO_VERSION=426

RUN apt-get update && \
    apt-get install -y wget curl openjdk-17-jdk-headless python-is-python3 less && \
    apt-get clean

ADD trino-server-${TRINO_VERSION} /opt/trino-server-${TRINO_VERSION}
RUN ln -s /opt/trino-server-${TRINO_VERSION} /opt/trino
RUN mkdir /etc/trino

ADD etc /opt/trino/etc
ADD catalog /opt/trino/etc/catalog

RUN mv /opt/trino/etc/coordinator-config.properties /opt/trino/etc/config.properties

COPY docker-entrypoint-coordinator.sh /opt/trino/docker-entrypoint-coordinator.sh
RUN chmod +x /opt/trino/docker-entrypoint-coordinator.sh

COPY init-bash.sh /opt/trino

ADD ranger-2.4.1-trino-plugin /opt/ranger-2.4.1-trino-plugin/
RUN mkdir /etc/ranger-2.4.1-trino-plugin