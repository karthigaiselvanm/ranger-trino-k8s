#!/bin/bash

#echo "node.id="$(cat /proc/sys/kernel/random/uuid) >> /etc/trino/etc/node.properties

#echo "discovery.uri=http://$DISCOVERT_HOST:8080" >> /etc/trino/etc/config.properties
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
etc/ranger-2.4.1-trino-plugin/enable-trino-plugin.sh && /etc/trino/bin/launcher run