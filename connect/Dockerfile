FROM confluentinc/cp-kafka-connect:5.0.0

WORKDIR /etc/confluent/docker
COPY . ./
WORKDIR /usr/share/java
# we only want elasticsearch connector for now
RUN du -sh . && \
  find . -maxdepth 1 -type d -name "kafka-connect*" -and ! -name "*elastic*" \
  -and ! -name "*file*" -print0 | xargs -0 rm -rf && \
  rm -rf confluent-control-center && \
  du -sh . && \
  chmod +x /etc/confluent/docker/*.sh

CMD /etc/confluent/docker/run.sh