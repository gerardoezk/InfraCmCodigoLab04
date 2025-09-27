# Configuración principal de Terraform
terraform {
  # Declaramos qué proveedores se van a utilizar
  required_providers {
    docker = {
      source  = "kreuzwerker/docker" # Proveedor oficial para gestionar Docker
      version = "~> 3.0"             # Versión compatible (cualquier 3.x)
    }
  }
}

# Definimos el proveedor Docker
# Esto permite a Terraform comunicarse con el demonio de Docker
provider "docker" {}
