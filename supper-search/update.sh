#!/bin/sh
cd /root/production-deploy/supper-search/ && docker-compose -f docker-compose.yml --env-file ./env up -d --force-recreate