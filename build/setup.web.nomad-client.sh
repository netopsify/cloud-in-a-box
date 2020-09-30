#!/usr/bin/env bash

sudo cp /vagrant/nomad/web.d/* /etc/nomad.d/

# Start the consul service
sudo systemctl enable consul
sudo systemctl start consul
# Check service logs using journalctl -u consul.service

sleep 30

# Start the service
sudo systemctl enable nomad
sudo systemctl start nomad
# Check service logs using journalctl -u consul.service

sleep 10

# Restart consul service to catch Nomad
sudo systemctl restart consul
