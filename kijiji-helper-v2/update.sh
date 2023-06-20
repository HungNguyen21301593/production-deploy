#!/bin/sh
docker stop $(docker ps -a -q) && docker system prune -a -f
cd /root/production-deploy/kijiji-helper-v2/ && docker-compose -f docker-compose.yml --env-file env --compatibility -p "kijiji" up -d --build --force-recreate