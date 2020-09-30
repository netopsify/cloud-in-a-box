job "web" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "service"

  group "web" {
    count = 3
    constraint {
      attribute    = "${meta.service}"
      set_contains = "web"
    }
    task "web" {
      driver = "docker"

      config {
        image = "nginx:latest"
        volumes = [
          "local/index.html:/usr/share/nginx/html/index.html"
        ]
      }
      template {
        data = <<EOH
        <h1>{{ env "attr.unique.network.ip-address" }} {{ env "attr.unique.hostname" }}</h1>
        EOH

        destination = "local/index.html"
      }

      resources {
        cpu    = 250
        memory = 100

        network {
          mbits = 10

          port "http" {
            static = 80
          }
        }
      }

      service {
        name = "web"
        port = "http"
        tags = ["webserver", "nginxs", "backend"]

        check {
          name     = "alive"
          type     = "tcp"
          port     = "http"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}