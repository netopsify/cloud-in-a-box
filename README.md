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

### Bootstrap Infrastructure

`make bootstrap`

- start consul agent on your local machine

`consul agent -config-file=desky.consul.hcl &`

- Browse to `http://172.16.1.11:8500/` to confirm consul is up and nodes are registered

- To log into Consul with Bootstrap token get the SecretID

`awk '/AccessorID/{print $1 $NF}' ansible/bootstrap.txt`
`awk '/SecretID/{print $1 $NF}' ansible/bootstrap.txt`

On you local machine export the token to use with CLI

`echo 'export CONSUL_HTTP_TOKEN=$(awk '/SecretID/{print $NF}' ansible/bootstrap.txt)' >> ~/.bashrc`
`source ~/.bashrc`

OR

`export CONSUL_HTTP_TOKEN=$(awk '/SecretID/{print $NF}' ansible/bootstrap.txt)`

Now on you `consul` GUI login with the bootstrap token.
