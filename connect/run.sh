#!/usr/bin/env bash
# cd /tmp || exit
# nohup python -m SimpleHTTPServer 8084 &>/dev/null &
# cd - || exit
echo "Launching Kafka Connect..."
/etc/confluent/docker/run

echo "Waiting for service to be up..."
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
  ./add-connectors.sh
fi
tail -f /dev/null