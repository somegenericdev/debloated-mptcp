#!/bin/sh

####SET THIS VARIABLE!!####
V2RAY_PASSWORD=mypassword
###########################

#update repositories
apt update -y
#install curl
apt install curl -y

#install v2ray
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)

#get config file and modify the password
wget https://raw.githubusercontent.com/somegenericdev/debloated-mptcp/main/vps/v2ray_config.conf -O /usr/local/etc/v2ray/aggregator_conf.json
sed -i "s/"mypassword"/$V2RAY_PASSWORD/" /usr/local/etc/v2ray/aggregator_conf.json

#enable systemd service
systemctl enable v2ray@aggregator_conf

#install, set and enable firewall
apt install ufw
ufw allow 22
ufw allow 31351
ufw enable -y


echo "Done. Rebooting now..."
reboot