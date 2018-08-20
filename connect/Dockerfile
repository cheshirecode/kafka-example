FROM confluentinc/cp-kafka-connect:5.0.0

WORKDIR /usr/share/java
COPY plugins ./
# we only want elasticsearch connector for now
RUN du -sh . && \
  find . -maxdepth 1 -type d -name "kafka-connect*" -and ! -name "*elastic*" \
  -and ! -name "*file*" -print0 | xargs -0 rm -rf && \
  rm -rf confluent-control-center && \
  du -sh .