# -*- mode: ruby -*-
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  # Don't let the VM run code on the host:
  config.vm.synced_folder ".", "/vagrant", disable: true
  config.vm.synced_folder "vagrant", "/vagrant"

  config.vm.provision "shell", inline: <<-SHELL
    for script in $(find /vagrant/scripts/.guest/bootstrap.d/*.sh); do
        bash "${script}";
    done
  SHELL
end
