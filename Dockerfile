FROM alpine:3.7

MAINTAINER Martin Alexis Samán Arata

EXPOSE 9092 2181 2888 3888

RUN apk update && \
    apk add bash && \
    apk add openjdk8-jre

COPY kafka kafka

ENTRYPOINT nohup kafka/bin/zookeeper-server-start.sh kafka/config/zookeeper.properties & nohup kafka/bin/kafka-server-start.sh kafka/config/server.properties
