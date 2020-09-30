Vagrant.configure("2") do |config|
    
  (1..1).each do |i|
    config.vm.define "cs-#{i}" do |cs|
      cs.vm.box = "bento/ubuntu-20.04"
      cs.vm.hostname = "consul-server-#{i}"
      cs.vm.network "public_network", bridge: "vmnet3", ip: "172.16.1.1#{i}"
    end
  end

  (1..1).each do |i|
    config.vm.define "vs-#{i}" do |vs|
      vs.vm.box = "bento/ubuntu-20.04"
      vs.vm.hostname = "vault-server-#{i}"
      vs.vm.network "public_network", bridge: "vmnet3", ip: "172.16.1.2#{i}"
    end
  end

  (1..1).each do |i|
    config.vm.define "ns-#{i}" do |ns|
      ns.vm.box = "bento/ubuntu-20.04"
      ns.vm.hostname = "nomad-server-#{i}"
      ns.vm.network "public_network", bridge: "vmnet3", ip: "172.16.1.3#{i}"
    end
  end

  config.vm.define "as" do |as|
    as.vm.box = "chaifeng/ubuntu-16.04-docker-18.09"
    as.vm.hostname = "automation-server"
    as.vm.network "public_network", bridge: "vmnet3", ip: "172.16.1.250"
  end

  (1..3).each do |i|
    config.vm.define "web#{i}" do |web|
      web.vm.box = "chaifeng/ubuntu-16.04-docker-18.09"
      web.vm.hostname = "web#{i}"
      web.vm.network "public_network", bridge: "vmnet3", ip: "172.16.1.20#{i}"
    end
  end

  config.vm.define "lb" do |lb|
    lb.vm.box = "chaifeng/ubuntu-16.04-docker-18.09"
    lb.vm.hostname = "lb"
    lb.vm.network "public_network", bridge: "vmnet3", ip: "172.16.1.101"
  end

end