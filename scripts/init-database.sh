#!/usr/bin/env bash
#sudo su
# root password
ROOTPASSWD=12345678
if [ ! -f /home/ubuntu/db.txt ]; then
    echo "Databases not found!"
    # create database
    mysql -uroot -p${ROOTPASSWD} -e "CREATE DATABASE IF NOT EXISTS MyDB /*\!40100 DEFAULT CHARACTER SET utf8 */;"
    mysql -uroot -p${ROOTPASSWD} -e "FLUSH PRIVILEGES;"
    # Restore database
    mysql -uroot -p${ROOTPASSWD} MyDB < /home/ubuntu/databases/MyDB.sql;
    echo "Creates databases: OK!"
    touch /home/ubuntu/db.txt
else
    echo "DATABASE ALREADY EXISTS!"
fi
