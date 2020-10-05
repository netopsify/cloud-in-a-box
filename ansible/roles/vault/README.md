Role Name
=========

Install Hashicorp Vault on Ubuntu. Can be used to setup a Vault cluster with `Consul` backend.
It can also setup Vault Client and telemetry options. Currently Prometheus and statsd are supported logic in telemetry stanza.

Requirements
------------

None

Role Variables
--------------

```yaml
datacenter: "dc1"
vault:
  ui: "true"
  api:
    scheme: http
    address: "{{ ansible_eth1.ipv4.address }}"
    port: "8200"
  listerner_address: "0.0.0.0"
  listerner_port: "8200"
  tls_disable: "true"
  file: # Not required if consul is set
    enable: true # Not required if consul is set
    path: /mnt/vault/data # Not required if consul is set
  consul:
    enable: true
    scheme: http
    address: localhost
    port: 8500
    path: vault/
  telemetry:
    enable: true
    type: statsd # or prometheus
    system_addr: "172.20.1.1" # Only needed for statsd
    system_port: "8125" # Only needed for statsd
    disable_hostname: false # Only needed for prometheus
  agent: # For Vault agent/client setup
    scheme: http
    server: 172.16.1.21
    port: 8200
    use_auto_auth_token: "true"
    auth_file_path: /home/vagrant/vault-token-via-agent
    listener:
      address: 127.0.0.1
      port: 8100
      tls_disable: "true"
```

Dependencies
------------

None

Example Playbook
----------------

Example Playbook

```yaml
    - hosts: servers
      roles:
         - { role: vault }
```

License
-------

BSD

Author Information
------------------

Author: Mirza Waqas Ahmed
For any issue contact me at m.w.ahmed@gmail.com
