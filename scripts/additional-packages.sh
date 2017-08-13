#!/usr/bin/env bash
sudo su
# Install NodeJS
curl -sL https://deb.nodesource.com/setup_7.x -o nodesource_setup.sh
bash nodesource_setup.sh
apt update && apt install -y nodejs
apt install -y nodejs
apt install -y build-essential

# Install PhantomJS
apt install -y chrpath libssl-dev libxft-dev libfreetype6 libfreetype6-dev libfontconfig1 libfontconfig1-dev
cd /usr/local/share
wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2
ln -sf /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/share/phantomjs
ln -sf /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs
ln -sf /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/bin/phantomjs
rm -rf phantomjs-2.1.1-linux-x86_64.tar.bz2
# Install CasperJS
npm install -g casperjs
# Clear box
apt autoremove -y