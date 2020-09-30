# Cloud Native Automation - Cloud in a box

## Pre-requisites

- Vagrant
- Terraform
- Ansible
- A bridge network for Virtualbox to communicate with read-world. In this example we are using vmnet3

## Install pre-requisites

`make prereq`

## Setup the infrastructure

- `make infra`

### Bootstrap Consul

- start your local consul agent

`consul agent -config-file=desky.consul.hcl &`

- Browse to `http://172.16.1.11:8500/` to confirm consul is up and nodes are registered

- Bootstrap Consul ACL

`vagrant ssh cs-1`

`consul acl bootstrap`

You will get an output similar to below:

```shell
AccessorID:       11111111-bbbbb-ccccc-dddddd-1222222222
SecretID:         11111111-bbbbb-ccccc-dddddd-1222222222
Description:      Bootstrap Token (Global Management)
Local:            false
Create Time:      2020-04-30 15:21:40.374305139 +0000 UTC
Policies:
   00000000-0000-0000-0000-000000000001 - global-management
```

`echo 'export CONSUL_HTTP_TOKEN="11111111-bbbbb-ccccc-dddddd-1222222222"' >> ~/.bashrc`
`exit`

On you local machine export the token

`export CONSUL_HTTP_TOKEN="11111111-bbbbb-ccccc-dddddd-1222222222"`

Now on you `consul` GUI login with the bootstrap token `11111111-bbbbb-ccccc-dddddd-1222222222`

### Setup Vault

#### Initialize

```shell
vagrant ssh vs-1
export VAULT_ADDR=http://127.0.0.1:8200
vault status
vault operator init
```

You will get an output similar to below:

```shell
Unseal Key 1: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
Unseal Key 2: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
Unseal Key 3: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
Unseal Key 4: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
Unseal Key 5: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

Initial Root Token: s.123d234324se324325

Vault initialized with 5 key shares and a key threshold of 3. Please securely
distribute the key shares printed above. When the Vault is re-sealed,
restarted, or stopped, you must supply at least 3 of these keys to unseal it
before it can start servicing requests.

Vault does not store the generated master key. Without at least 3 key to
reconstruct the master key, Vault will remain permanently sealed!

It is possible to generate new unseal keys, provided you have a quorum of
existing unseal keys shares. See "vault operator rekey" for more information.
```

#### Unseal

`vault operator unseal`
*repeat this three time using above useal key*

`vault status`

To use the token on the local machine run

```shell
echo "export VAULT_ADDR=http://127.0.0.1:8200" >> ~/.bashrc
echo "export VAULT_TOKEN=s.123d234324se324325" >> ~/.bashrc
```

Now checkout the tools

- check Consul `http://172.16.1.11:8500/`
- check Vault `http://172.16.1.21:8200/`
- check Nomad `http://172.16.1.31:4646/`
