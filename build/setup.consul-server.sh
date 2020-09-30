#!/usr/bin/env bash

# Copy the configuration file
sudo cp /vagrant/consul/cs-consul.d/* /etc/consul.d/

# Start the service
sudo systemctl enable consul
sudo systemctl start consul
# Check service logs using journalctl -u consul.service