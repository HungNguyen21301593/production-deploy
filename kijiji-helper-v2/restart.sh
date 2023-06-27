#!/bin/sh
docker-compose -f docker-compose.yml --env-file env --compatibility -p "kijiji" restart