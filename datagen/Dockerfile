FROM maven:alpine
WORKDIR /tmp
RUN apk add --no-cache bash git openssh 
RUN git clone https://github.com/Landoop/landoop-avro-generator && \
    cd landoop-avro-generator && \
    mvn clean install && \
    cd target

FROM maven:alpine

COPY --from=0 /tmp/landoop-avro-generator/target /tmp/landoop-avro-generator/
COPY . .
WORKDIR /tmp/landoop-avro-generator

CMD ./landoop-avro-generator $MESSAGES $PARTITIONS $THROTTLE