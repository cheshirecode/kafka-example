# source
curl -X POST -H 'Content-Type:application/json' \
    -H 'Accept:application/json' \
    -d @connect.source.datagen.json \
    http://connect:8083/connectors
# sinks
curl -X POST -H "Content-Type: application/json" \
    --data @kafka-connect-elasticsearch-sink.json \
    http://connect:8083/connectors

curl -X POST -H "Content-Type: application/json" \
    --data @connect.sink.elasticsearch.json \
    http://connect:8083/connectors

curl -X POST -H "Content-Type: application/json" \
    --data @kafka-connect-file-sink.json \
    http://connect:8083/connectors