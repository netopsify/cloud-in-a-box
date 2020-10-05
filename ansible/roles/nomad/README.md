Role Name
=========

Install and setup Hashicorp Nomad on Ubuntu.
It can be used to setup Server and Clients both. Comes with default `exec` and `docker` driver logic.

Requirements
------------

none

Role Variables
--------------

The following role variables can be defined.

```yaml
datacenter: "dc1"
nomad:
  common:
    data_dir: /opt/nomad
    log_level: "INFO"
    advertise:
      interface: "eth1"
    consul:
      enable: true
      address: 127.0.0.1
      port: 8500
      auto_advertise: "true"
      server_auto_join: "true"
  server:
    bootstrap_expect: "1"
    bind_addr: "0.0.0.0"
    client:
      enable: true
      network_interface: "eth1"
    plugin:
      exec: true
  client:
    network_interface: "eth1"
    servers:
      - 172.16.1.31
    meta:
    - owner: IT
    - service: web
    - rack: "rack-12-1"
    plugin:
      exec: true
      docker: true
```

Dependencies
------------

None

Example Playbook
----------------

Example playbook

```yaml
    - hosts: servers
      roles:
         - { role: nomad }
```

License
-------

BSD

Author Information
------------------

Author: Mirza Waqas Ahmed
For any issue contact me at m.w.ahmed@gmail.com
