# Cloud Native Automation - Cloud in a box

## Introduction

With many organizations moving towards cloud the challenge of managing infrastructure on-prem still exists. The cloud teams are making infrastructure changes at high volumes whereas the on-prem teams are still stuck with manual and static infrastructure. For things like autoscaling, which can provide great operational benefit within cloud infrastructure, achieving the same on-prem is still a big challeng.
However, and what if we can bring cloud style operations and features to on prem too. And leverage techniques like autoscaling.
Hence, we introduce the concept of `Cloud in a box`.

## Cloud in a box

Cloud in a box is a framework which comes bundled with set of processes, workflows and infrastructure automation tools, that will provide seamless and cloud native automation capabilities to enterprises for their on Cloud or on prem infrastructure.

Our vision is to enable enterprises with capability of managing on-prem and Cloud infrastructure seamlessly with cloud style operation.

### Unified Multi-Cloud operations

One of the benefit of leveraging the framework would be to unify operations across cloud infrastructure too. For organization either looking to host their infrastructure on multiple public clouds or if they already have footprints on them but struggling to manage that multi-domain infrastructure; this framework will add great value.
Enterprises will find comfort in educating their staff on one approach and tool but leverage multi-clouds infrastructure.

### Tools

To achieve our vision we believe we can tie to just one tool however we do believe that there are tools available in the market that not only support our vision but also allow us to implement it in easy way.

#### Introducing foundational tools

The foundation is built using Hashicorp tools that provide not only the tools necessary but also enable us to achieve our cloud in a box framework, if used with the right approach and workflow. However and as you may understand one size does not fit all and hence we are in the course of implementing our framework we are utilizing other automation tools such as Ansible and even Python to paint the complete picture..

## Purpose of this repository

*[NOTE]* **This work is in progress !!!**

The purpose of this work is demonstrate the implementation of our `cloud in a box` vision.
Another goal of this repo is to demonstrate a build of standard automation/orchestration stack that runs standard workflows and processes to achieve the vision.

### Pre-requisites

- Vagrant
- Terraform
- Ansible
- A bridge network for Virtualbox to communicate with read-world. In this example we are using vmnet3

### Install pre-requisites

`make prereq`

### Setup the infrastructure

- `make infra`

#### Bootstrap Infrastructure

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
