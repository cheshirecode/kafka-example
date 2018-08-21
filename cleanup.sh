#!/usr/bin/env sh
ZK=zookeeper:2181
BOOTSTRAP_SERVER=broker:9092
kafka-topics --delete --zookeeper "$ZK" --topic generator-text
kafka-topics --delete --zookeeper "$ZK" --topic generator-types
kafka-topics --delete --zookeeper "$ZK" --topic generator-types-upsert
kafka-topics --delete --zookeeper "$ZK" --topic generator-sql
kafka-topics --delete --zookeeper "$ZK" --topic generator-shipments
kafka-topics --delete --zookeeper "$ZK" --topic generator-sales
kafka-topics --delete --zookeeper "$ZK" --topic generator-evolution-widen
kafka-topics --delete --zookeeper "$ZK" --topic generator-evolution-add
sleep 2
kafka-topics --zookeeper "$ZK" --list | grep "generator-"

kafka-topics --delete --zookeeper "$ZK" --topic _schemas
kafka-run-class kafka.tools.ZooKeeperMainWrapper -server "$ZK" delete /schema_registry/schema_id_counter
kafka-avro-console-consumer --bootstrap-server "$BOOTSTRAP_SERVER" --topic _schemas --from-beginning