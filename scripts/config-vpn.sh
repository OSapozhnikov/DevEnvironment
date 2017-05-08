#!/usr/bin/env bash
if [ -e /home/ubuntu/config/vpn/user.conf ]; then
	echo "Settings VPN..."
	sudo cp /home/ubuntu/config/vpn/user.conf /etc/openvpn/
	sudo systemctl disable openvpn
	sudo systemctl enable openvpn@user.service
	sudo systemctl start openvpn@user.service
	sudo cp /home/ubuntu/config/vpn/vpn_keepalive_br.sh /usr/bin/vpn_keepalive_br.sh
	sudo chmod ug+x /usr/bin/vpn_keepalive_br.sh
else
	echo "VPN config files empty!"
	echo "The VPN setting will not be performed!"
fi