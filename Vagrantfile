# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |cfg|
    cfg.env.enable
	cfg.ssh.username = 'vagrant'
	cfg.ssh.forward_x11 = true
	cfg.ssh.shell = "bash"

	cfg.vm.box = "debian/buster64"

	cfg.vm.network "private_network", ip: ENV['VM_IP'], netmask: "255.255.0.0"
	cfg.vm.provider "virtualbox" do |vbox|
		vbox.name = ENV['VM_NAME']
		vbox.customize ["modifyvm", :id, "--cpus", 1]
		vbox.customize ["modifyvm", :id, "--memory", "2048"]
		vbox.customize ["modifyvm", :id, "--name", ENV['VM_NAME']]
		vbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]

		vbox.customize ["modifyvm", :id, "--nic1", "nat"]
		vbox.customize ["modifyvm", :id, "--nictype1", "virtio"]

		vbox.customize ["modifyvm", :id, "--nic2", "hostonly"]
		vbox.customize ["modifyvm", :id, "--nictype2", "virtio"]
		vbox.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
		vbox.customize ["modifyvm", :id, "--audio", "none"]

		vbox.customize ["setextradata", :id, "--VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
		vbox.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 500]
	end

	cfg.vm.provision "shell", path: "./init.sh", privileged: false
end

