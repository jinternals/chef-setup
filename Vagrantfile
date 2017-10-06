# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.hostname = "chef-server"

  config.vm.network :private_network, ip: "10.0.15.10"
  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.synced_folder "package/", "/package"
  config.vm.synced_folder "keys/", "/keys"

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
  end

  config.vm.provision "shell", path: "bootstrap.sh"

end
