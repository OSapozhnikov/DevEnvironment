# README #

### Default project adress ###
* BinaryUno: devel.mysite.com  
* etc  

### Hosts directives ###
For work you need add this directives in host file:  
>192.168.25.10 devel.mysite.com www.devel.mysite.com  

### Configuration ###
* Apache 2.4.7, MySQL 5.6, PHP 5.6/7.1  
* Database configuration: User - root, passwd - 12345678  

Forwarding ports, additional(If need please enable in Vagrantfile):  
>HTTP guest: 80, host: 8081  
>MySQL guest: 3306, host: 3307  
>xDebug guest: 9001, host: 9001  

* Network adress: 192.168.25.10
* phpMyAdmin
* Projects must be located in the "www" directory

Repository for deployment:
>git clone git@github.com:Your/Repo.git  


### Use 'vagrant ssh' on Windows ###
You can use to PuTTY(KiTTY, GIT bash or other SSH clients)  
Host Name: 127.0.0.1  
Port: 2222  
Login: vagrant  
Password: vagrant  
GIT Bash:  
>ssh -p 2222 vagrant@127.0.0.1

### Use xDebug ###
In /home/vagrant/scripts directory is xdebug.sh script. Run this script for on or off xDebug mode.  
In Vagrant:  
>sudo sh ./home/vagrant/scripts/xdebug.sh 

You will see the message:  
>"xDEBAG mode ON" or "xDEBAG mode OFF"

### Additional settings ###
If needed please Manual Config for your Project in Vagrant file:
* config.vm.hostname
* config.vm.synced_folder
* vb.name
* apache virtualhost in /config/web/ and sait-config.sh
* You can use a reverse proxy Nginx to redirect http traffic from 8080 to port 80.
* In the "nginx-proxy" directory contains a file to configure revers-proxy for nginx
