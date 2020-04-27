#!/bin/sh
set -eux

echo "*** Installing Kafka and dependencies"
apk add --update --no-cache jq curl

#APACHE_MIRROR=$(curl --stderr /dev/null https://www.apache.org/dyn/closer.cgi\?as_json\=1 | jq -r '.preferred')
APACHE_MIRROR=http://mirrors.tuna.tsinghua.edu.cn/apache/

wget -c $APACHE_MIRROR/zookeeper/zookeeper-$ZOOKEEPER_VERSION/zookeeper-$ZOOKEEPER_VERSION.tar.gz -O - | tar -xz
mkdir zookeeper
mv zookeeper-$ZOOKEEPER_VERSION/conf zookeeper/

# download kafka binaries
wget -c $APACHE_MIRROR/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz -O - | tar -xz
mv kafka_$SCALA_VERSION-$KAFKA_VERSION/* .

# Set explicit, basic configuration
# listeners=PLAINTEXT://0.0.0.0:9092,PLAINTEXT_HOST://0.0.0.0:19092
# listener.security.protocol.map=PLAINTEXT:PLAINTEXT,PLAINTEXT_HOST:PLAINTEXT
cat > config/server.properties <<-EOF
broker.id=0
zookeeper.connect=127.0.0.1:2181
replica.socket.timeout.ms=1500
log.dirs=/kafka/logs
auto.create.topics.enable=true
offsets.topic.replication.factor=1
listeners=PLAINTEXT://0.0.0.0:9092,PLAINTEXT_HOST://0.0.0.0:19092
listener.security.protocol.map=PLAINTEXT:PLAINTEXT,PLAINTEXT_HOST:PLAINTEXT
EOF

mkdir /kafka/logs

echo "*** Cleaning Up"
rm -rf zookeeper-$ZOOKEEPER_VERSION

echo "*** Image build complete"
