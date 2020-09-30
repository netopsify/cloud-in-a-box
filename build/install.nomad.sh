#!/usr/bin/env bash

export NOMAD_VERSION="0.12.4"
curl \
  --silent \
  --remote-name https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip /home/vagrant/nomad_${NOMAD_VERSION}_linux_amd64.zip

unzip /home/vagrant/nomad_${NOMAD_VERSION}_linux_amd64.zip
sudo chown root:root /home/vagrant/nomad
sudo mv /home/vagrant/nomad /usr/local/bin/

nomad -autocomplete-install
complete -C /usr/local/bin/nomad nomad

sudo mkdir --parents /opt/nomad
# sudo cp /vagrant/build/systemd/nomad.service /etc/systemd/system/nomad.service
sudo cp /vagrant/build/systemd/nomad.service /usr/lib/systemd/system/nomad.service

# Common configuration
sudo mkdir --parents /etc/nomad.d
sudo chmod 700 /etc/nomad.d
sudo cp /vagrant/nomad/common/* /etc/nomad.d/
