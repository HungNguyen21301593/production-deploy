#!/bin/sh
docker stop $(docker ps -a -q) && docker system prune -a -f && docker-compose -f docker-compose.yml --env-file ./env up -d --force-recreate