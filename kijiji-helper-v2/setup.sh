#!/bin/sh
apt  install docker-compose -f
read -p "Enter Username: " username
echo "UserName: $username"
echo "HostName: $username-PC"
cp env-ba env
sed -i "s/DUMB-PC/$username-PC/g" env 
docker-compose -f docker-compose.yml --env-file env --compatibility -p "kijiji" up -d --build --force-recreate
chmod +x /root/production-deploy/kijiji-helper-v2/update.sh
crontab -l | { cat; echo "0 23 * * * /root/production-deploy/kijiji-helper-v2/update.sh >> /tmp/cron_output "; } | crontab -
sudo fallocate -l 4G /swapfile && sudo chmod 600 /swapfile && sudo mkswap /swapfile && sudo swapon /swapfile && sudo cp /etc/fstab /etc/fstab.bak && echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
sudo reboot