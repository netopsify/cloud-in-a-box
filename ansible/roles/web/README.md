Role Name
=========

This is a simple Role to setup run a nginx container as webservers with a page `ip.html` showing its name and IP.

Requirements
------------

Dockers is installed.

Role Variables
--------------

```yaml
web:
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
         - { role: web }
```

License
-------

BSD

Author Information
------------------

Author: Mirza Waqas Ahmed
For any issue contact me at m.w.ahmed@gmail.com
