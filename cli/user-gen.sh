#!/usr/bin/env sh
attempt_counter=0
max_attempts=5
sleep_duration=5
until $(curl -s --output /dev/null --head --fail http://rest-proxy:8082); do
  if [ ${attempt_counter} -eq ${max_attempts} ];
  then
    echo "Max attempts reached! http://rest-proxy:8082 isn't up or reachable."
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
  #
  curl -X POST -H "Content-Type: application/vnd.kafka.avro.v2+json" \
    -H "Accept: application/vnd.kafka.v2+json" \
    --data @users.json \
    "http://rest-proxy:8082/topics/users"
fi
