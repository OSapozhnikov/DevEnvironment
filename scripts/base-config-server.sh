#!/usr/bin/env bash
sudo su
# Add repository and update server
add-apt-repository -y ppa:ondrej/php
add-apt-repository -y ppa:ondrej/mysql-5.7
apt update && apt upgrade -y

# Install main packages
apt install -y curl inetutils-traceroute build-essential python-software-properties git cron openvpn
apt install -y apache2 libapache2-mod-php
apt remove -y php7-mysql

# Install PHP-5.6
apt install -y php5.6 php5.6-curl php5.6-mcrypt php5.6-cli php5.6-gd php5.6-intl php5.6-xmlrpc php5.6-mysqlnd php5.6-common php5.6-mbstring php5.6-xdebug
echo " -> Update PHP conf"
sed -i 's/^post_max_size = 8M/post_max_size = 64M/' /etc/php/5.6/apache2/php.ini;
sed -i 's/^upload_max_filesize = 2M/upload_max_filesize = 64M/' /etc/php/5.6/apache2/php.ini;
sed -i 's/^max_execution_time = 30/max_execution_time = 60/' /etc/php/5.6/apache2/php.ini;
sed -i 's/^; max_input_vars = 1000/max_input_vars = 2000/' /etc/php/5.6/apache2/php.ini;

# Install PHP-7.1
apt install -y php7.1 php7.1-curl php7.1-mcrypt php7.1-cli php7.1-gd php7.1-intl php7.1-xmlrpc php7.1-mysqlnd php7.1-common php7.1-mbstring php7.0-zip php-xdebug
echo " -> Update PHP conf"
sed -i 's/^post_max_size = 8M/post_max_size = 64M/' /etc/php/7.1/apache2/php.ini;
sed -i 's/^upload_max_filesize = 2M/upload_max_filesize = 64M/' /etc/php/7.1/apache2/php.ini;
sed -i 's/^max_execution_time = 30/max_execution_time = 60/' /etc/php/7.1/apache2/php.ini;
sed -i 's/^; max_input_vars = 1000/max_input_vars = 2000/' /etc/php/7.1/apache2/php.ini;

echo "ServerName devenv" >> /etc/apache2/apache2.conf
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Config locales and timezone
locale-gen en_US.UTF-8
timedatectl set-timezone Europe/Kiev

# Install mysql
export DEBIAN_FRONTEND=noninteractive
ROOTPASSWD='12345678'
echo debconf mysql-server/root_password password $ROOTPASSWD | debconf-set-selections
echo debconf mysql-server/root_password_again password $ROOTPASSWD | debconf-set-selections
apt-get -y install mysql-server mysql-client

# Config web server
a2enmod headers
a2enmod rewrite
phpenmod mcrypt
phpenmod mbstring
#cp /home/vagrant/config/xdebug.ini /etc/php5/mods-available/xdebug.ini
systemctl restart apache2

# Added switch PHP version script
cp /home/ubuntu/scripts/switch-php-to.sh /usr/bin/switch-php-to && chmod +x /usr/bin/switch-php-to