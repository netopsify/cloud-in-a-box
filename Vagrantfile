Vagrant.configure("2") do |config|
  # config.vm.provision "shell", path: "build/bootstrap.sh", privileged: false
    
  (1..1).each do |i|
    config.vm.define "cs-#{i}" do |cs|
      cs.vm.box = "bento/ubuntu-20.04"
      cs.vm.hostname = "consul-server-#{i}"
      cs.vm.network "public_network", bridge: "vmnet3", ip: "172.16.1.1#{i}"
      # cs.vm.provision "shell", path: "build/setup.consul-server.sh", privileged: false
    end
  end

  (1..1).each do |i|
    config.vm.define "vs-#{i}" do |vs|
      vs.vm.box = "bento/ubuntu-20.04"
      vs.vm.hostname = "vault-server-#{i}"
      vs.vm.network "public_network", bridge: "vmnet3", ip: "172.16.1.2#{i}"
      # vs.vm.provision "shell", path: "build/install.vault.sh", privileged: false
      # vs.vm.provision "shell", path: "vault_init_and_unseal.sh",
      #   privileged: true,
      #   env: {"PATH" => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin"}
    end
  end

  (1..1).each do |i|
    config.vm.define "ns-#{i}" do |ns|
      ns.vm.box = "bento/ubuntu-20.04"
      ns.vm.hostname = "nomad-server-#{i}"
      ns.vm.network "public_network", bridge: "vmnet3", ip: "172.16.1.3#{i}"
      # ns.vm.provision "shell", path: "build/install.nomad.sh", privileged: false
      # ns.vm.provision "shell", path: "build/setup.nomad-server.sh", privileged: false
    end
  end

  config.vm.define "as" do |as|
    as.vm.box = "chaifeng/ubuntu-16.04-docker-18.09"
    as.vm.hostname = "automation-server"
    as.vm.network "public_network", bridge: "vmnet3", ip: "172.16.1.250"
    # as.vm.provision "shell", path: "build/install.nomad.sh", privileged: false
    # as.vm.provision "shell", path: "build/setup.consul-client.sh", privileged: false
    # as.vm.provision "shell", path: "build/setup.nomad-client.sh", privileged: false
    # as.vm.provision "shell", path: "build/install.consul-template.sh", privileged: false
    # as.vm.provision "shell", path: "build/setup.automation-server.sh", privileged: false
  end

  (1..3).each do |i|
    config.vm.define "web#{i}" do |web|
      web.vm.box = "chaifeng/ubuntu-16.04-docker-18.09"
      web.vm.hostname = "web#{i}"
      web.vm.network "public_network", bridge: "vmnet3", ip: "172.16.1.20#{i}"
      # web.vm.provision "shell", path: "build/setup.consul-client.sh", privileged: false
      # web.vm.provision "shell", path: "build/install.nomad.sh", privileged: false
      # web.vm.provision "shell", path: "build/setup.web.nomad-client.sh", privileged: false
      # web.vm.provision "shell", path: "build/setup.web.watches.sh", privileged: false
    end
  end

  config.vm.define "lb" do |lb|
    lb.vm.box = "chaifeng/ubuntu-16.04-docker-18.09"
    lb.vm.hostname = "lb"
    lb.vm.network "public_network", bridge: "vmnet3", ip: "172.16.1.101"
    # lb.vm.provision "shell", path: "build/install.nomad.sh", privileged: false
    # lb.vm.provision "shell", path: "build/setup.consul-client.sh", privileged: false
    # lb.vm.provision "shell", path: "build/setup.nomad-client.sh", privileged: false
    # lb.vm.provision "shell", path: "build/install.consul-template.sh", privileged: false
    # lb.vm.provision "shell", path: "build/setup.consul-template.sh", privileged: false
  end

end