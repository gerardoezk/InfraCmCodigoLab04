// Definición de redes Docker para la arquitectura

// Capa de Aplicación: conecta los contenedores que forman parte de la lógica de negocio
resource "docker_network" "app_net" {
  name   = "app_net"   # Nombre de la red
  driver = "bridge"    # Tipo de red: "bridge" permite la comunicación interna entre contenedores
}

// Capa de Persistencia: conecta los servicios de bases de datos y almacenamiento
resource "docker_network" "persistence_net" {
  name   = "persistence_net"
  driver = "bridge"
}

// Capa de Monitoreo: conecta herramientas de observabilidad (ej. Grafana, Prometheus)
resource "docker_network" "monitor_net" {
  name   = "monitor_net"
  driver = "bridge"
}
