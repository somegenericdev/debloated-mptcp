#!/bin/sh

#####SET THESE THREE VARIABLES!!#####
VPSIP=80.11.1.1
V2RAY_EXEC_PATH=/v2ray/v2ray_armv7
V2RAY_PASSWORD=mypassword
######################################


V2RAY_PARENT_DIR="$(dirname "$V2RAY_EXEC_PATH")"
V2RAY_CONF_PATH="${V2RAY_PARENT_DIR}/v2ray_config.json"

rm -f /tmp/iptables_config.conf
rm -f /tmp/v2ray_config.conf
rm -f /tmp/v2ray_service

#download the template files
wget https://raw.githubusercontent.com/somegenericdev/debloated-mptcp/main/gateway/iptables_config.conf -O /tmp/iptables_config.conf
wget https://raw.githubusercontent.com/somegenericdev/debloated-mptcp/main/gateway/v2ray_config.conf -O /tmp/v2ray_config.conf
wget https://raw.githubusercontent.com/somegenericdev/debloated-mptcp/main/gateway/v2ray_service -O /tmp/v2ray_service

#set them according to the value of the first three variables
sed -i "s/"ServerIP"/$VPSIP/" /tmp/iptables_config.conf
sed -i "s/"ServerIP"/$VPSIP/" /tmp/v2ray_config.conf
sed -i "s/"mypassword"/$V2RAY_PASSWORD/" /tmp/v2ray_config.conf
sed -i "s@"yourconfpathhere"@$V2RAY_CONF_PATH@" /tmp/v2ray_service
sed -i "s@"yourexecpathhere"@$V2RAY_EXEC_PATH@" /tmp/v2ray_service

#move them to their location
rm -f /etc/firewall.user
rm -f $V2RAY_CONF_PATH
rm -f /etc/init.d/v2ray
rm -f /etc/rc.local
mv /tmp/iptables_config.conf /etc/firewall.user
mv /tmp/v2ray_config.conf $V2RAY_CONF_PATH
mv /tmp/v2ray_service /etc/init.d/v2ray
wget https://raw.githubusercontent.com/somegenericdev/debloated-mptcp/main/gateway/rc.local -O /etc/rc.local

#activate v2ray's service to execute v2ray at boot
chmod +x /etc/init.d/v2ray
/etc/init.d/v2ray enable

echo "Done! Reboot, then make sure to set all of the routes in the routing table with 'route add'"
