# Recurso que descarga la imagen de Grafana Enterprise versión 9.4.7
resource "docker_image" "grafana" {
  name         = "grafana/grafana-enterprise:9.4.7"  # Imagen oficial de Grafana
  keep_locally = false                               # No mantiene la imagen local si no se usa
}

# Recurso que crea y ejecuta un contenedor basado en la imagen de Grafana
resource "docker_container" "grafana" {
  image = docker_image.grafana.image_id    # Usa la imagen descargada arriba
  
  # Nombre del contenedor: incluye el workspace de Terraform (ej: dev, prod)
  name  = "grafana-${terraform.workspace}"
  
  # Conecta el contenedor a la red de monitorización
  networks_advanced {
    name = docker_network.monitor_net.name
  }
  
  # Conecta también el contenedor a la red de aplicaciones
  networks_advanced {
    name = docker_network.app_net.name
  }
  
  # Expone el puerto 3000 (interno y externo), usado por la interfaz web de Grafana
  ports {
    internal = 3000
    external = 3000
  }
  
  # Configuración de reinicio: siempre se reinicia si el contenedor se detiene
  restart = "always"
}
