#!binbash

# Mise à jour des paquets
sudo apt update

# Installation des pré-requis
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Ajouter la clé officielle de Docker
curl -fsSL httpsdownload.docker.comlinuxdebiangpg  sudo apt-key add -

# Ajouter le repository Docker pour Debian
sudo add-apt-repository deb [arch=amd64] httpsdownload.docker.comlinuxdebian $(lsb_release -cs) stable

# Mise à jour des paquets
sudo apt update

# Installer Docker
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Démarrer Docker
sudo systemctl start docker

# Activer Docker au démarrage
sudo systemctl enable docker

# Vérifier l'installation
sudo docker --version
