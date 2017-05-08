#!/usr/bin/env bash
sudo su
# Hach for Windows
ping -c 5 192.168.25.1
# Constants
RED='\033[0;31m'
GR='\033[0;32m'
NC='\033[0m' # No Color
OVPNS=$(ifconfig tun0)
REALIP=$(wget http://ipinfo.io/ip -qO -)
echo "You're good now :)"
echo -e "${GR}Your output IP:${RED} $REALIP ${NC}"
if [[ -z "$OVPNS" ]]; then
    echo -e "${RED}Dont connect to OpenVPN Server!${NC}"
else
    echo -e "${GR}Status connect to OpenVPN: OK!${NC}
$OVPNS"
fi