FROM alpine
WORKDIR /tmp/
COPY . .
RUN apk add --update curl && \
    rm -rf /var/cache/apk/* && \
    chmod +x *.sh

CMD ./user-gen.sh && \
    tail -f /dev/null