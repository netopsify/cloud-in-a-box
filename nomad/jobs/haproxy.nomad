job "haproxy" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "service"

  group "haproxy" {
    count = 1

    task "haproxy" {
      driver = "docker"
      constraint {
        attribute = "${node.unique.name}"
        value     = "lb"
      }
      config {
        image = "haproxy:alpine"
        volumes = [
          "/home/vagrant/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg"
        ]
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
        name = "lb"
        port = "http"
        tags = ["lb", "haproxy", "frontend"]

        check {
          name     = "alive"
          type     = "tcp"
          port     = "http"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
    task "touch_cfg_file" {
      lifecycle {
        hook = "prestart"
      }
      driver = "raw_exec"

      config {
        command = "bash"
        args = ["-c", "touch /home/vagrant/haproxy.cfg"]
      }

      resources {
        cpu    = 100
        memory = 128
      }
    }
  }
}