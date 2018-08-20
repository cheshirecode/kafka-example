
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


### List topics
```
docker exec -t kx-connect kafka-topics --zookeeper zookeeper:2181 --list
```

### Get Docker host IP
`ifconfig | grep -e "inet "` 

###