#!/usr/bin/env sh
echo "Waiting for Kafka Connect to be up..."
attempt_counter=0
max_attempts=5
sleep_duration=5
until $(curl -s --output /dev/null --head --fail http://connect:8083); do
  if [ ${attempt_counter} -eq ${max_attempts} ];
  then
    echo "Max attempts reached! http://connect:8083 isn't up or reachable."
    is_service_up=1
    break
  else
    printf '.'
    attempt_counter=$((attempt_counter+1))
    sleep $sleep_duration
  fi
done

if [ -z ${is_service_up+x} ];
then
  echo "Adding connectors..."

  curl -sS -X POST -H 'Content-Type:application/json' \
      -H 'Accept:application/json' \
      -d @connect.events.source.datagen.json \
      http://connect:8083/connectors

  curl -sS -X POST -H "Content-Type: application/json" \
      --data @connect.events.sink.elasticsearch.json \
      http://connect:8083/connectors

  curl -sS -X POST -H "Content-Type: application/json" \
      --data @connect.events.sink.file.json \
      http://connect:8083/connectors

  curl -sS -X POST -H "Content-Type: application/json" \
      --data @connect.users.sink.elasticsearch.json \
      http://connect:8083/connectors

  curl -sS -X POST -H "Content-Type: application/json" \
      --data @connect.users.sink.file.json \
      http://connect:8083/connectors
fi