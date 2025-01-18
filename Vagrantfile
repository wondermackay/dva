Vagrant.configure("2") do |config|
  # Définir la VM Debian avec une IP statique
  config.vm.define "debian" do |debian|
    debian.vm.box = "debian/bullseye64"  # Utiliser une box Debian
    debian.vm.network "private_network", ip: "192.168.56.10"  # IP statique pour Debian

    # Provisionner la machine Debian pour installer Ansible (optionnel)
    debian.vm.provision "shell", inline: <<-SHELL
      sudo apt update
      sudo apt install -y ansible
    SHELL
  end

  # Définir la VM Ubuntu avec une IP statique
  config.vm.define "ubuntu" do |ubuntu|
    ubuntu.vm.box = "ubuntu/bionic64"  # Utiliser une box Ubuntu
    ubuntu.vm.network "private_network", ip: "192.168.56.20"  # IP statique pour Ubuntu
  end
end