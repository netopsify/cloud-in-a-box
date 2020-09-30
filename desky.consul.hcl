ui = true
datacenter = "dc1"

advertise_addr = "172.16.1.1"
client_addr = "0.0.0.0"
retry_join = [
  "172.16.1.11",
  "172.16.1.12",
  "172.16.1.13"
]

data_dir = "/tmp/consul"
log_level = "INFO"

telemetry = {
  dogstatsd_addr = "localhost:8125"
  disable_hostname = true
}