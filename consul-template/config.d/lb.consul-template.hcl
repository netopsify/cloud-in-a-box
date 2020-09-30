template {
  source = "/opt/consul-template/haproxy.ctmpl"
  destination= "/home/vagrant/haproxy.cfg"
  command = "nomad job stop -purge haproxy ; sleep 10 ; nomad job run /vagrant/nomad/jobs/haproxy.nomad"
}
