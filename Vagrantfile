# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.define "neo4j01" do |neo|
    neo.vm.provision :shell, :path => "setup.sh"
    neo.vm.box = "ubuntu/trusty64"
    neo.vm.network :forwarded_port, guest: 7474, host: 7474
    neo.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 2
      vb.customize ["modifyvm", :id, "--usb", "off"]
      vb.customize ["modifyvm", :id, "--usbehci", "off"]
    end
  end
end
