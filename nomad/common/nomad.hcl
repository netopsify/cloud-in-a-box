datacenter = "dc1"

data_dir = "/opt/nomad"
log_level = "INFO"

advertise {
  http = "{{ GetInterfaceIP `eth1` }}"
  rpc  = "{{ GetInterfaceIP `eth1` }}"
  serf = "{{ GetInterfaceIP `eth1` }}"
}

// consul {
//   address = "127.0.0.1:8500"
//   auto_advertise = true
//   server_auto_join = true
// }