# Recurso que descarga la imagen oficial de PostgreSQL versión 15 (ligera, basada en Alpine)
resource "docker_image" "postgres" {
  name = "postgres:15-alpine"
}

# Recurso que despliega un contenedor con PostgreSQL
resource "docker_container" "postgres" {
  image = docker_image.postgres.image_id          # Usa la imagen descargada arriba
  name  = "postgres-${terraform.workspace}"       # Nombre dinámico (según workspace de Terraform)

  # Conexión a la red de persistencia
  networks_advanced {
    name = docker_network.persistence_net.name
  }
  
  # Exposición del puerto estándar de PostgreSQL
  ports {
    internal = 5432    # Puerto interno dentro del contenedor
    external = 5432    # Puerto externo accesible desde el host
  }

  # Variables de entorno para configurar la base de datos
  env = [
    "POSTGRES_DB=myapp",         # Nombre de la base de datos inicial
    "POSTGRES_USER=postgres",    # Usuario administrador
    "POSTGRES_PASSWORD=password" # Contraseña del usuario administrador
  ]
}
