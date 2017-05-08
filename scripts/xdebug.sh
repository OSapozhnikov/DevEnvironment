#!/usr/bin/env bash
#sudo su
OPTIOND=$(cat -n /etc/php5/mods-available/xdebug.ini|grep 6)
OPTION="     6	;xdebug.remote_autostart = 1"
if [ "$OPTION" = "$OPTIOND" ]; then
    sed -i 's/^;xdebug.remote_autostart = 1/xdebug.remote_autostart = 1/' /etc/php5/mods-available/xdebug.ini;
    service apache2 restart;
    service apache2 status;
    echo "xDEBAG mode ON";
else
    sed -i 's/^xdebug.remote_autostart = 1/;xdebug.remote_autostart = 1/' /etc/php5/mods-available/xdebug.ini;
    service apache2 restart;
    service apache2 status;
    echo "xDEBAG mode OFF";
fi
#cat -n /etc/php5/mods-available/xdebug.ini|grep 6