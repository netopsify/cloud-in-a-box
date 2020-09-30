server = true
ui = true
// bootstrap = true
bootstrap_expect = 1

acl = {
    enabled = true
    default_policy = "allow"
    enable_token_persistence = true
}

telemetry = {
    dogstatsd_addr = "172.20.1.1:8125"
    disable_hostname = false
}