#!/usr/bin/env bash

# Install Vault
export VAULT_URL="https://releases.hashicorp.com/vault" VAULT_VERSION="1.5.3"

curl \
    --silent \
    --remote-name \
   "${VAULT_URL}/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip" /home/vagrant/vault_${VAULT_VERSION}_linux_amd64.zip

curl \
    --silent \
    --remote-name \
    "${VAULT_URL}/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_SHA256SUMS" /home/vagrant/vault_${VAULT_VERSION}_SHA256SUMS

curl \
    --silent \
    --remote-name \
    "${VAULT_URL}/${VAULT_VERSION}/${VAULT_VERSION}/vault_${VAULT_VERSION}_SHA256SUMS.sig" /home/vagrant/vault_${VAULT_VERSION}_SHA256SUMS.sig

unzip /home/vagrant/vault_${VAULT_VERSION}_linux_amd64.zip
sudo chown root:root /home/vagrant/vault
sudo mv /home/vagrant/vault /usr/local/bin/
vault -autocomplete-install
complete -C /usr/local/bin/vault vault
sudo setcap cap_ipc_lock=+ep /usr/local/bin/vault
sudo useradd --system --home /etc/vault.d --shell /bin/false vault

# Create VAULT Directory
sudo mkdir --parents /etc/vault.d
sudo cp /vagrant/vault/vault.hcl /etc/vault.d/vault.hcl
sudo chown --recursive vault:vault /etc/vault.d
sudo chmod 640 /etc/vault.d/vault.hcl

# Start the consul service
sudo systemctl enable consul
sudo systemctl start consul
# Check service logs using journalctl -u consul.service

sleep 30

# Start the vault service
sudo cp /vagrant/build/systemd/vault.service /usr/lib/systemd/system/vault.service
sudo systemctl enable vault
sudo systemctl start vault