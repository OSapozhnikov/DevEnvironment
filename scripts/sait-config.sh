#!/usr/bin/env bash
# Setting up projects
sudo su
cd /var/www/
mkdir /var/www/MySite
mkdir /var/www/logs

# Site config
cp /home/ubuntu/config/web/apache-conf/* /etc/apache2/sites-available/

# Enable sites
a2ensite MySite.conf

# Config project
chown -R www-data:www-data /var/www/*
systemctl restart apache2

# Additional
echo "192.168.25.10 dev.environment.loc www.dev.environment.loc" >> /etc/hosts
