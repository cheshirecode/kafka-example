FROM cheshirecode/alpine-runit

COPY . /tmp/
WORKDIR /tmp
CMD chmod +x *.sh && \
  ./add-connectors.sh && \
  ./user-gen.sh && \
  tail -f /dev/null