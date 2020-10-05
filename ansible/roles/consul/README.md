Role Name
=========

Install and setup Hashicorp Consul server and client agent on Ubuntu.
It can be used to bootstrap consul cluster, enable ACL and Telemetry.

Requirements
------------

None

Role Variables
--------------

The following variables can be defined.

```yaml
datacenter: "dc1"
consul:
  ui: "true"
  bootstrap_expect: "1"
  bootstrap_token_output_dir: /vagrant/ansible/secrets
  client_addr: "0.0.0.0"
  advertise_int: eth1 # or use advertise_addr: '172.16.1.11'
  servers:
    - 172.16.1.11
  data_dir: /opt/consul
  log_level: "INFO"
  disable_remote_exec: "false"
  enable_script_checks: "true"
  enable_local_script_checks: "true"
  acl:
    enable: true
    default_policy: "allow"
    enable_token_persistence: "true"
  telemetry:
    enable: true
    dogstatsd_addr: "172.20.1.1:8125"
    disable_hostname: "false"
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
         - { role: consul }
```

License
-------

BSD

Author Information
------------------

Author: Mirza Waqas Ahmed
For any issue contact me at m.w.ahmed@gmail.com
