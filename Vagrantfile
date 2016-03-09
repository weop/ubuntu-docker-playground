Vagrant.configure("2") do |config|

  #box
  config.vm.provider "virtualbox" do |v|
      v.name = "dock3r"
      v.customize ["modifyvm", :id, "--memory", "1024"]
  end

  #networking
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "dock3r.localhost"
  config.vm.network :private_network, ip: "192.168.10.10"

  #allow incoming connections on docker host
  #config.vm.network :forwarded_port, host: 8080, guest: 80, auto_correct: true
  config.vm.network :forwarded_port, host: 2375, guest: 2375, auto_correct: true

  config.vm.provision "file", source: "./ddaemon.sh", destination: "~/.ddaemon.sh"

  #starts provision
  config.vm.provision "run", type: "shell" do |s|
    s.path = "init.sh"
  end

  config.vm.provision "shell", inline: "sudo reboot"

end
