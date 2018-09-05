#!/usr/bin/env sh
ALL="-f docker-compose.base.yml -f docker-compose.extra.yml -f docker-compose.ui.yml"
docker-compose $ALL "$@"