client {
  enabled = true
  network_interface = "eth1"
  servers           = ["172.16.1.31", "172.16.1.32", "172.16.1.33"]
  meta {
    "owner" = "IT"
    "service" = "web"
    "rack" = "rack-12-1"
  }
}

addresses {
  rpc  = "{{ GetInterfaceIP `eth1` }}"
  serf = "{{ GetInterfaceIP `eth1` }}"
}

// advertise {
//   http = "$LOCAL_IP:4646"
// }

plugin "raw_exec" {
  config {
    enabled = true
  }
}

plugin "docker" {
  config {
    endpoint = "unix:///var/run/docker.sock"

    volumes {
      enabled      = true
      selinuxlabel = "z"
    }

    allow_privileged = false
    # allow_caps       = ["CHOWN", "NET_RAW"]

    # allow_caps can also be set to "ALL"
    allow_caps = ["ALL"]
  }
}
