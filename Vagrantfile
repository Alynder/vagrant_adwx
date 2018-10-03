
Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.network "forwarded_port", guest: 3000, host: 9090
  ####### Provision #######
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "prov/playbook.yml"
    ansible.verbose = true
  config.vm.provision "shell", path: "script.sh"
  end
end
