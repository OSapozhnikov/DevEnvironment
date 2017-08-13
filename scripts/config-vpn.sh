#!/usr/bin/env bash
sudo su
if [ -e /home/ubuntu/config/vpn/user.conf ]; then
	echo "Settings VPN..."
	cp /home/ubuntu/config/vpn/user.conf /etc/openvpn/
	systemctl disable openvpn
	systemctl enable openvpn@user.service
	systemctl start openvpn@user.service
	cp /home/ubuntu/config/vpn/vpn_keepalive_br.sh /usr/bin/vpn_keepalive_br.sh
	chmod ug+x /usr/bin/vpn_keepalive_br.sh
else
	echo "VPN config files empty!"
	echo "The VPN setting will not be performed!"
fi