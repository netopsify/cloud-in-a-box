template {
  source = "/opt/consul-template/templates/haproxy.ctmpl"
  destination= "/opt/config/haproxy.cfg"
  command = "docker restart lb"
}
