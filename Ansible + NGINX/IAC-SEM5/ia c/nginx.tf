resource "docker_container" "app1" {  
  name  = "app1"
  image = docker_image.nginx.image_id
  
  networks_advanced {
    name = docker_network.app_net.name
  }
  
  networks_advanced {
    name = docker_network.persistence_net.name
  }

  volumes {
    host_path      = abspath("${path.module}/../host_volumes/web1")
    container_path = "/usr/share/nginx/html"
    read_only      = false
  }
}

resource "docker_container" "app2" {  
  name  = "app2"
  image = docker_image.nginx.image_id
  
  networks_advanced {
    name = docker_network.app_net.name
  }
  
  networks_advanced {
    name = docker_network.persistence_net.name
  }

  volumes {
    host_path      = abspath("${path.module}/../host_volumes/web2")
    container_path = "/usr/share/nginx/html"
    read_only      = false
  }
}

resource "docker_container" "app3" {  
  name  = "app3"
  image = docker_image.nginx.image_id
  
  networks_advanced {
    name = docker_network.app_net.name
  }
  
  networks_advanced {
    name = docker_network.persistence_net.name
  }

  volumes {
    host_path      = abspath("${path.module}/../host_volumes/web3")
    container_path = "/usr/share/nginx/html"
    read_only      = false
  }
}