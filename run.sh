#!/usr/bin/env sh
docker-compose -f docker-compose.base.yml -f docker-compose.extra.yml "$@"