# Contenedor para la aplicación web 1
resource "docker_container" "app1" {  
  name  = "app1"                          # Nombre del contenedor
  image = docker_image.nginx.image_id     # Imagen base: NGINX
  
  # Conexión del contenedor a las redes
  networks_advanced {
    name = docker_network.app_net.name     # Red de aplicación
  }
  networks_advanced {
    name = docker_network.persistence_net.name # Red de persistencia
  }

  # Montaje de volumen: conecta la carpeta host_volumes/web1 al directorio HTML de NGINX
  volumes {
    host_path      = abspath("${path.module}/../host_volumes/web1") # Ruta en el host
    container_path = "/usr/share/nginx/html"                        # Ruta dentro del contenedor
    read_only      = false                                          # Permite escritura
  }
}

# Contenedor para la aplicación web 2
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

# Contenedor para la aplicación web 3
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
