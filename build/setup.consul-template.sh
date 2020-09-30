#!/usr/bin/env bash

curl -X PUT -d '4096' http://localhost:8500/v1/kv/prod/portal/haproxy/maxconn
curl -X PUT -d 'http' http://localhost:8500/v1/kv/prod/portal/haproxy/mode
curl -X PUT -d '5s' http://localhost:8500/v1/kv/prod/portal/haproxy/timeout-connect
curl -X PUT -d '50s' http://localhost:8500/v1/kv/prod/portal/haproxy/timeout-client
curl -X PUT -d '5s' http://localhost:8500/v1/kv/prod/portal/haproxy/timeout-server
curl -X PUT -d 'enable' http://localhost:8500/v1/kv/prod/portal/haproxy/stats
curl -X PUT -d '/haproxy' http://localhost:8500/v1/kv/prod/portal/haproxy/stats-uri
curl -X PUT -d '5s' http://localhost:8500/v1/kv/prod/portal/haproxy/stats-refresh

# Create template directory.
sudo mkdir --parents /opt/consul-template
sudo chmod 755 /opt/consul-template

# Copy templates
sudo cp /vagrant/consul-template/templates/* /opt/consul-template

# Install as service
sudo mkdir --parent /usr/lib/systemd/system
sudo cp /vagrant/build/systemd/consul-template.service /usr/lib/systemd/system/consul-template.service
# Check service logs using journalctl -u consul-template.service

# ########################################################################
# # Run the backend web servers nomad job
nomad job run /vagrant/nomad/jobs/nginx.nomad

sleep 15

# # Run the load balancer nomad job
nomad job run /vagrant/nomad/jobs/haproxy.nomad
# ########################################################################

sleep 45

# # Start the service
sudo systemctl enable consul-template
sudo systemctl start consul-template &
# # Check service logs using journalctl -u consul-template.service