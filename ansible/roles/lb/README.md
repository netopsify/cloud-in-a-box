Role Name
=========

This is a simple Role to setup run a HAPROXY container as load balancer whose configuration is setup using Hashicorp Consul k/v store and updated using consul-template with Consul Watch.

This role is to be used in conjunction with Consul role.

Requirements
------------

Docker is installed and a working Hashicorp consul cluster.
Working key/value store and consul-template installed on the machine where this container is to run.

Role Variables
--------------

```yaml
lb:
  config_dir: /opt/config
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
         - { role: lb }
```

License
-------

BSD

Author Information
------------------

Author: Mirza Waqas Ahmed
For any issue contact me at m.w.ahmed@gmail.com
