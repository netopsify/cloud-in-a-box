datacenter = "dc1"

advertise_addr = "{{ GetInterfaceIP `eth1` }}"
client_addr = "0.0.0.0"
retry_join = [
    "172.16.1.11",
    "172.16.1.12",
    "172.16.1.13"
  ]

data_dir = "/opt/consul"

log_level = "INFO"

disable_remote_exec = false
enable_script_checks = true
enable_local_script_checks = true
