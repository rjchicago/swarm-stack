#!/bin/sh

# docker swarm init 2>/dev/null

# logrotate
docker build -t rjchicago/logrotate:1.0.0 ./logrotate

# traefik
docker network create -d overlay traefik-net 2>/dev/null
docker network create -d overlay traefik-net-admin 2>/dev/null
docker stack deploy -c traefik/docker-compose.yml traefik

# elastic
docker network create -d overlay elastic-net 2>/dev/null
docker stack deploy -c elastic/docker-compose.yml -c elastic/docker-compose.traefik.yml --prune elastic

# filebeat
docker network create -d overlay elastic-net 2>/dev/null
docker stack deploy -c filebeat/docker-compose.yml -c filebeat/docker-compose.traefik.yml --prune filebeat

# portainer
docker stack deploy -c portainer/docker-compose.yml -c portainer/docker-compose.traefik.yml --prune portainer