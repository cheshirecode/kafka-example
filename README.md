
### Check Avro messages of a topic
```
docker exec -t kx-connect kafka-avro-console-consumer --bootstrap-server broker:9092 \
    --property schema.registry.url=http://schema-registry:8081 \
    --property print.key=true   --from-beginning \
    --topic users
```

### Check messages of a topic
```
docker exec -t kx-connect kafka-console-consumer --bootstrap-server broker:9092 \
    --property print.key=true   --from-beginning \
    --topic generated.events
```

### Tail the text file sink
```
docker exec -t kx-connect tail -f /tmp/kafka-file-sink.txt
```

### List topics
```
docker exec -t kx-connect kafka-topics --zookeeper zookeeper:2181 --list
```

### Get Docker host IP
`ifconfig | grep -e "inet "` 

### Clean up datagen
docker cp cleanup.sh kx-connect:/tmp; docker exec -t kx-connect /tmp/cleanup.sh && rm /tmp/cleanup.sh