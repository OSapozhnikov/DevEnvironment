#!/bin/bash
NC=$(echo -e "\033[0m")
YW=$(echo -e "\033[33m")
BD=$(echo -e "\033[1m")
switchToFive () {
    echo "$BD$YW-> Switching from 7th to 5th version of PHP$NC"
    sudo a2dismod php7.1
    sudo a2enmod php5.6
    echo "$BD$YW-> Restarting Apache$NC"
    sudo systemctl restart apache2
}
switchToSeven () {
    echo "$BD$YW-> Switching from 7th to 5th version of PHP$NC"
    sudo a2dismod php5.6
    sudo a2enmod php7.1
    echo "$BD$YW-> Restarting Apache$NC"
    sudo systemctl restart apache2
}
case $1 in
    5)
    switchToFive;;
    7)
    switchToSeven;;
    *)
    echo "Usage: $0 [5 | 7]"
esac