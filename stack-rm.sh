#!/bin/sh

docker stack rm portainer
docker stack rm filebeat
docker stack rm elastic
docker stack rm traefik

# cleanup containers
# docker system prune -f

# cleanup volumes
# docker volume prune -f

