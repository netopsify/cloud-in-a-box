#!/usr/bin/env bash

# Download consul-template
CONSUL_TEMPLATE_VERSION=0.25.1
curl https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip -o consul-template.zip

# Install consul
unzip consul-template.zip
sudo chmod +x consul-template
sudo mv consul-template /usr/bin/consul-template
sudo chown root:root /usr/bin/consul-template

# Create config directories
sudo mkdir --parent /etc/consul-template.d
sudo chmod 755 /etc/consul-template.d

# Copy config files
sudo cp /vagrant/consul-template/config.d/* /etc/consul-template.d