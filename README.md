
### Check Avro messages of a topic
```
docker exec connect kafka-avro-console-consumer --bootstrap-server broker:9092 \
    --property schema.registry.url=http://schema-registry:8081 \
    --property print.key=true   --from-beginning \
    --topic users
```

### Get Docker host IP
`ifconfig | grep -e "inet "` 

###