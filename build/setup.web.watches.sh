#!/usr/bin/env bash

sudo rm -f /etc/consul.d/watches.json
sudo cp /vagrant/consul/watches/web/* /etc/consul.d

# cat > /home/vagrant/echoscript.sh <<EOF
# #!/usr/bin/env bash
# logger -i -t CONSUL-EVENT -s An event has been logged by Consul
# EOF

sudo systemctl restart consul
