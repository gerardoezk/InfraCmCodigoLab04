# Define y descarga una imagen de Docker específica de NGINX.
resource "docker_image" "nginx" {
  name         = "nginx:stable-alpine3.21-perl"    # Nombre y tag de la imagen a obtener desde un registro
  keep_locally = false    # Si 'false', la imagen se elimina localmente si ya no es usada por Terraform
}

# Crea y gestiona un contenedor Docker a partir de la imagen anterior
resource "docker_container" "proxy" {  
  name  = "proxy"    # Nombre que se le dará al contenedor
  image = docker_image.nginx.image_id    # Asocia el contenedor con la imagen de NGINX descargada previamente

# Conecta el contenedor a una red Docker gestionada por Terraform
  networks_advanced {
    name = docker_network.app_net.name
  }

  # Mapea el puerto 8080 de la máquina host al puerto 80 del contenedor.
  ports {
    internal = 80
    external = 8080
  }

# Monta un volumen para persistir o proporcionar archivos de configuración.
# La ruta del host debe coincidir con la variable 'nginx_conf_host' en el playbook.yaml
  volumes
  volumes {
    host_path      = abspath("${path.module}/../host_volumes/nginx_conf")    # Ruta de la carpeta en la máquina host
    container_path = "/etc/nginx/conf.d"    # Ruta donde se montará la carpeta dentro del contenedor
    read_only      = false    # Permite que el contenedor escriba en el volumen
  }

}

