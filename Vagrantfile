Vagrant.configure("2") do |config|

  #box
  config.vm.provider "virtualbox" do |v|
      v.name = "dock3r"
      v.customize ["modifyvm", :id, "--memory", "1024"]
  end

  #boxinfo
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "dock3r.localhost"
  config.vm.network :private_network, ip: "192.168.10.10"

  #allow incoming connections on docker port
  #config.vm.network :forwarded_port, host: 2375, guest: 2375, auto_correct: true

  #starts provision
  config.vm.provision "run", type: "shell" do |s|
  #  s.privileged = false
    s.path = "init.sh"
  end

end
