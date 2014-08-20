# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  Vagrant.require_version ">= 1.4.3"



  config.vm.define :generic do | generic |    
    generic.vm.box = "demandcube/centos-65_x86_64-VB-4.3.8"
    
    # Create a private network
    generic.vm.network :private_network, ip: "192.168.1.2", virtualbox__intnet: "neverwinterDP"
    generic.vm.hostname = "generic"
    
    generic.vm.synced_folder  ".", "/vagrant", disabled: true
    
    #digitalOcean provider
    generic.vm.provider :digital_ocean do |provider, override|
      override.ssh.private_key_path = './DemandCubePlaybooks/roles/teamaccess/files/teamaccess'
      provider.token  = '4af329d2baa4686af5ef372006389680197d1be905db948043679961a050b3ad'
      provider.region = 'sfo1'
      provider.image  = 'CentOS 6.5 x64'
      provider.size   = '512MB'
    end
    
    #VirtualBox provider
    generic.vm.provider :virtualbox do |vb|
      vb.name = "generic"
      vb.customize ["modifyvm", :id, "--memory", "512"]
      # vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
    
  end

  config.vm.define :elasticsearch do | elasticsearch |    
    elasticsearch.vm.box = "demandcube/centos-65_x86_64-VB-4.3.8"
    
    # Create a private network
    elasticsearch.vm.network :private_network, ip: "192.168.1.3", virtualbox__intnet: "neverwinterDP"
    elasticsearch.vm.hostname = "elasticsearch"
    
    elasticsearch.vm.synced_folder  ".", "/vagrant", disabled: true
    
    #digitalOcean provider
    elasticsearch.vm.provider :digital_ocean do |provider, override|
      override.ssh.private_key_path = './DemandCubePlaybooks/roles/teamaccess/files/teamaccess'
      provider.token  = '4af329d2baa4686af5ef372006389680197d1be905db948043679961a050b3ad'
      provider.region = 'sfo1'
      provider.image  = 'CentOS 6.5 x64'
      provider.size   = '512MB'
    end
    
    #VirtualBox provider
    elasticsearch.vm.provider :virtualbox do |vb|
      vb.name = "elasticsearch"
      vb.customize ["modifyvm", :id, "--memory", "512"]
      # vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
    
  end
end

