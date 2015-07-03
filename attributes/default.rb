default["confluent"]["version"] = "1.0"
default["confluent"]["scala_version"] = "2.10.4"

# kafka defaults
default["confluent"]["kafka"]["server.properties"]["broker.id"] = "0"
default["confluent"]["kafka"]["server.properties"]["port"] = "9092"
default["confluent"]["kafka"]["server.properties"]["num.network.threads"] = "3"
default["confluent"]["kafka"]["server.properties"]["num.io.threads"] = "8"
default["confluent"]["kafka"]["server.properties"]["socket.send.buffer.bytes"] = "102400"
default["confluent"]["kafka"]["server.properties"]["socket.receive.buffer.bytes"] = "102400"
default["confluent"]["kafka"]["server.properties"]["socket.request.max.bytes"] = "104857600"
default["confluent"]["kafka"]["server.properties"]["log.dirs"] = "/tmp/kafka-logs"
default["confluent"]["kafka"]["server.properties"]["num.partitions"] = "1"
default["confluent"]["kafka"]["server.properties"]["num.recovery.threads.per.data.dir"] = "1"
default["confluent"]["kafka"]["server.properties"]["log.retention.hours"] = "168"
default["confluent"]["kafka"]["server.properties"]["log.segment.bytes"] = "1073741824"
default["confluent"]["kafka"]["server.properties"]["log.retention.check.interval.ms"] = "300000"
default["confluent"]["kafka"]["server.properties"]["log.cleaner.enable"] = "false"
default["confluent"]["kafka"]["server.properties"]["zookeeper.connect"] = "localhost:2181"
default["confluent"]["kafka"]["server.properties"]["zookeeper.connection.timeout.ms"] = "6000"

# zookeeper defaults
default["confluent"]["kafka"]["zookeeper.properties"]["dataDir"] = "/tmp/zookeeper"
default["confluent"]["kafka"]["zookeeper.properties"]["clientPort"] = "2181"
default["confluent"]["kafka"]["zookeeper.properties"]["maxClientCnxns"] = "0"

# schema registry-defaults
default["confluent"]["kafka"]["schema-registry.properties"]["port"] = "8081"
default["confluent"]["kafka"]["schema-registry.properties"]["kafkastore.connection.url"] = "localhost:2181"
default["confluent"]["kafka"]["schema-registry.properties"]["kafkastore.topic"] = "_schemas"
default["confluent"]["kafka"]["schema-registry.properties"]["debug"] = "false"
