#!/bin/sh
docker stop $(docker ps -a -q) && docker system prune -a -f
cd /root/production-deploy/supper-search/ && docker-compose -f docker-compose.yml --env-file ./env up -d --force-recreate