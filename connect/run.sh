#!/usr/bin/env bash
cd /tmp || exit
nohup python -m SimpleHTTPServer 8084 &>/dev/null &
cd - || exit
/etc/confluent/docker/run

attempt_counter=0
max_attempts=5
until $(curl -s --output /dev/null --head --fail http://connect:8083); do
  if [ ${attempt_counter} -eq ${max_attempts} ];
  then
    echo "Max attempts reached!"
    is_service_up=1
  else
    printf '.'
    attempt_counter=$((attempt_counter+1))
    sleep 3
  fi
done

if [ -z ${is_service_up+x} ];
then
  #
  curl -X POST -H "Content-Type: application/json" \
      --data @kafka-connect-elasticsearch-sink.json \
      http://connect:8083/connectors
  curl -X POST -H "Content-Type: application/json" \
      --data @kafka-connect-file-sink.json \
      http://connect:8083/connectors
  #
fi
tail -f /dev/null