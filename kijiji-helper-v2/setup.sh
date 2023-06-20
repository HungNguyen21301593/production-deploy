#!/bin/sh
read -p "Enter Username: " username
echo "UserName: $username"
echo "HostName: $username-PC"
cp env-ba env
sed -i "s/DUMB-PC/$username-PC/g" env 
docker-compose -f docker-compose.yml --env-file env --compatibility -p "kijiji" up -d --build --force-recreate
chmod +x /root/production-deploy/kijiji-helper-v2/update.sh
crontab -l | { cat; echo "0 23 * * * /root/production-deploy/kijiji-helper-v2/update.sh >> /tmp/cron_output "; } | crontab -
