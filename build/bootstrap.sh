#!/usr/bin/env bash

# Install unzip
sudo apt-get update
sudo apt-get install -y unzip bc stress jq

cat >> ~/.bashrc <<"END"

# Coloring of hostname in prompt to keep track of what's what in demos, blue provides a little emphasis but not too much like red
NORMAL="\[\e[0m\]"
BOLD="\[\e[1m\]"
DARKGRAY="\[\e[90m\]"
BLUE="\[\e[34m\]"
PS1="$DARKGRAY\u@$BOLD$BLUE\h$DARKGRAY:\w\$ $NORMAL"

END

# Download consul
CONSUL_VERSION=$(curl -s https://checkpoint-api.hashicorp.com/v1/check/consul | jq -r ".current_version")
curl https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip -o consul.zip

# Install consul
unzip consul.zip consul
sudo chmod +x consul
sudo mv consul /usr/bin/consul

# Consul Autocompletion
consul -autocomplete-install
complete -C /usr/bin/consul consul

# Create a unique, non-privileged system user to run Consul and create its data directory.
sudo useradd --system --home /etc/consul.d --shell /bin/false consul
sudo mkdir --parents /opt/consul

# Create config directory
sudo mkdir /etc/consul.d
sudo chmod a+w /etc/consul.d
sudo chown --recursive consul:consul /opt/consul

# # Create consul data directory
# sudo mkdir -p /opt/consul/data

# Copy common consul config
sudo cp /vagrant/consul/common-consul.d/* /etc/consul.d

# Install as service
sudo mkdir --parent /usr/lib/systemd/system
sudo cp /vagrant/build/systemd/consul.service /usr/lib/systemd/system/consul.service
# Check service logs using journalctl -u consul.service