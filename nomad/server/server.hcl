server {
  enabled = true
  bootstrap_expect = 1
}

bind_addr = "0.0.0.0"

plugin "raw_exec" {
  config {
    enabled = true
  }
}
client {
  enabled = true
  network_interface = "eth1"
}