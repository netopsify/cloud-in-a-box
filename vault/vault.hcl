listener "tcp" {
  address       = "0.0.0.0:8200"
  tls_disable = true
}
storage "consul" {
  address = "http://localhost:8500"
  path = "vault/"
}
ui = true
