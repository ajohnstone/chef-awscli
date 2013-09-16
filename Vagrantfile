# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "awscli-berkshelf"

  config.vm.box = "Berkshelf-CentOS-6.3-x86_64-minimal"

  config.vm.box_url = "https://dl.dropbox.com/u/31081437/Berkshelf-CentOS-6.3-x86_64-minimal.box"

  config.vm.network :private_network, ip: "33.33.33.10"

  config.ssh.max_tries = 40
  config.ssh.timeout   = 120

  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
      "recipe[awscli]"
    ]
  end
end
