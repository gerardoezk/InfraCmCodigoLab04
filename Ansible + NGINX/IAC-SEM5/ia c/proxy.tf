resource "docker_image" "nginx" {
  name         = "nginx:stable-alpine3.21-perl"
  keep_locally = false
}

resource "docker_container" "proxy" {  
  name  = "proxy"
  image = docker_image.nginx.image_id
  
  networks_advanced {
    name = docker_network.app_net.name
  }

  ports {
    internal = 80
    external = 8080
  }

  volumes {
    host_path      = abspath("${path.module}/../host_volumes/nginx_conf")
    container_path = "/etc/nginx/conf.d"
    read_only      = false
  }
}