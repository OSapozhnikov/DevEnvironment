# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
	# SSH config
	config.ssh.username = "ubuntu"
	config.ssh.insert_key = true
	# SSH for linux and winrm for Windows
    config.vm.communicator = "ssh"
	# Set port forwarding
    #config.vm.network "forwarded_port", guest: 80, host: 8081, auto_correct: true
    #config.vm.network "forwarded_port", guest: 3306, host: 3307, auto_correct: true
    #config.vm.network "forwarded_port", guest: 9001, host: 9001, auto_correct: true
	# VirtualBox
    config.vm.define "virtualbox" do |virtualbox|
        virtualbox.vm.hostname = "DevEnv"
        virtualbox.vm.box = "ubuntu/xenial64"
        virtualbox.vm.box_version = ">= 0"
        virtualbox.vm.box_check_update = true
        virtualbox.vm.network "private_network", ip: "192.168.25.10"
    # Set VM CPU & RAM limits
        config.vm.provider "virtualbox" do |vb|
        vb.name = "DevEnv"
            vb.gui = false
            vb.cpus = "2"
            vb.memory = "1024"
            vb.customize ["modifyvm", :id, "--ioapic", "on"]
            vb.customize ["modifyvm", :id, "--cpuexecutioncap", "75"]
        end
    end
	# Set directory mapping
	config.vm.synced_folder "./www/", "/var/www/",
	owner: "www-data",
	group: "www-data",
	mount_options: ["dmode=777,fmode=777"],
	create: true
	config.vm.synced_folder "./config", "/home/ubuntu/config",
	owner: "ubuntu",
	group: "ubuntu",
	mount_options: ["dmode=777,fmode=777"],
	create: true
	config.vm.synced_folder "./scripts", "/home/ubuntu/scripts",
	owner: "ubuntu",
	group: "ubuntu",
	mount_options: ["dmode=777,fmode=777"],
	create: true
	config.vm.synced_folder "./databases", "/home/ubuntu/databases",
	owner: "ubuntu",
	group: "ubuntu",
	mount_options: ["dmode=777,fmode=777"],
	create: true
	# Provision
	config.vm.provision "shell", path: "./scripts/base-config-server.sh"
	config.vm.provision "shell", path: "./scripts/sait-config.sh"
	config.vm.provision "shell", path: "./scripts/phpadmin-config.sh"
	config.vm.provision "shell", path: "./scripts/init-database.sh"
	config.vm.provision "shell", path: "./scripts/additional-packages.sh"
	config.vm.provision "shell", path: "./scripts/config-vpn.sh"
	config.vm.provision "shell", path: "./scripts/finish-config.sh", run: 'always'
end
