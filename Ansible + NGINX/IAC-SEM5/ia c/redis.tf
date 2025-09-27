resource "docker_image" "redis" { # Define un recurso para una imagen de Docker, llamado "redis".
  name = "redis:7.4.1-alpine" # Especifica la imagen y su versión (etiqueta).
}

resource "docker_container" "redis" { # Define un recurso para un contenedor, llamado "redis".
  name = "redis-${terraform.workspace}" # Asigna un nombre dinámico al contenedor usando el workspace.
  image = docker_image.redis.image_id # Usa el ID de la imagen "redis" definida anteriormente.

  networks_advanced { # Inicia la configuración de redes para el contenedor.
    name = docker_network.persistence_net.name # Lo conecta a una red llamada "persistence_net".
  }

  ports { # Inicia la configuración del mapeo de puertos.
    internal = 6379 # El puerto que la aplicación escucha dentro del contenedor.
    external = 6379 # El puerto expuesto en la máquina anfitriona (host).
  }

  restart = "always" # Configura el contenedor para que se reinicie siempre si se detiene.
}
