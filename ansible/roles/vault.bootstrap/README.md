Role Name
=========

Bootstrap Hashicorp Vault.
This role can be used to initialize and unseal vault using `Shamir seals`.
It will store the keys and root token at `bootstrap_token_output_dir`.
It will also fetch `vault-secrets.json` file for you locally at `bootstrap_token_local_output_location`
If the process fails at unseal level you can define the the keys manually like below and it will work too.

```yaml
vault_keys:
  json:
    keys: []
```

Requirements
------------

Vault installed.

Role Variables
--------------

```yaml
vault:
  bootstrap_token_output_dir: /vagrant/ansible/secrets
  bootstrap_token_local_output_location: vault-secrets.json
  bootstrap:
    secret_shares: 5
    secret_threshold: 3
```

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Example playbook

```yaml
    - hosts: servers
      roles:
         - { role: vault.bootstrap }
```

License
-------

BSD

Author Information
------------------

Author: Mirza Waqas Ahmed
For any issue contact me at m.w.ahmed@gmail.com
