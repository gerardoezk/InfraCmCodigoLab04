# InfraCmCodigoLab05: Ansible + NGINX con Terraform (IaC)

Este proyecto está diseñado para automatizar el despliegue de una infraestructura con **NGINX** utilizando **Infraestructura como Código (IaC)**. Empleamos **Terraform** para provisionar los recursos base y **Ansible** para la gestión de la configuración del servidor web/proxy.

## Equipo de Desarrollo

* Caipo Trujillo, Sonia Fernanda
* Leyva Sandoval, Piero Alejandro
* Asunción Chira, Luis Gerardo
* Rodriguez Malca, Rodrigo Abel
* Vera Romero, Vanesa Marili

---

## Estructura del Proyecto

El código está organizado en dos módulos funcionales: **`iac`** (aprovisionamiento con Terraform) y **`configuracion`** (automatización con Ansible).

Ansible + NGINX/

├── IAC-SEM5/

│   ├── configuracion/

│   │   ├── files/

│   │   │   ├── index1.html       # Archivo estático

│   │   │   ├── index2.html       # Archivo estático

│   │   │   └── index3.html       # Archivo estático

│   │   ├── templates/

│   │   │   └── nginx.conf        # Plantilla de configuración de NGINX (Jinja2)

│   │   ├── inventory.ini         # Inventario de Ansible (localhost por defecto)

│   │   └── playbook.yaml         # Playbook principal de Ansible

│   └── iac/

│       ├── grafana.tf            # Terraform para Grafana (Monitorización)

│       ├── main.tf               # Configuración principal de Terraform

│       ├── networks.tf           # Terraform para configuración de red

│       ├── nginx.tf              # Terraform para la instancia NGINX

│       ├── postgre.tf            # Terraform para PostgreSQL (Base de datos)

│       ├── proxy.tf              # Terraform para un servicio proxy/Load Balancer

│       └── redis.tf              # Terraform para Redis (Caché)

└── README.md


---

## Configuración con Ansible

El módulo `configuracion` se encarga de la instalación y ajustes de **NGINX** en el servidor provisionado.

### Elementos Clave de Ansible

| Archivo | Función Principal | Detalle de Contenido |
| :--- | :--- | :--- |
| **`playbook.yaml`** | Secuencia de tareas automatizadas. | Instalar NGINX, copiar configuración y desplegar archivos estáticos. |
| **`inventory.ini`** | Definición de los hosts. | `localhost ansible_connection=local` (Configuración para ejecución local). |
| **`templates/`** | Almacena plantillas dinámicas. | Contiene la plantilla **Jinja2** (`nginx.conf`) para generar la configuración de NGINX. |
| **`files/`** | Archivos a transferir. | Contiene los archivos HTML que serán servidos. |

### Ejecución del Playbook

1.  Asegúrate de tener **Ansible instalado**.
2.  Navega al directorio **`configuracion`**.
3.  Ejecuta el siguiente comando:

    ```bash
    ansible-playbook -i inventory.ini playbook.yaml
    ```

---

## Aprovisionamiento de Infraestructura (Terraform)

El módulo `iac` define y provisiona los recursos de infraestructura necesarios en el entorno (nube o local).

### Servicios y Configuración de Infraestructura

| Archivo | Descripción del Recurso |
| :--- | :--- |
| **`main.tf`** | **Configuración Principal de Terraform:** Define el proveedor de nube y el *backend* del estado. |
| **`networks.tf`** | **Configuración de Red:** Define la topología de red, subredes y reglas de seguridad. |
| **`nginx.tf`** | **Instancia NGINX:** Aprovisiona la VM o contenedor principal para NGINX. |
| **`proxy.tf`** | **Servicio Proxy Adicional:** Aprovisiona un balanceador de carga o un servicio proxy dedicado. |
| **`postgre.tf`** | **PostgreSQL:** Aprovisiona el servicio de base de datos relacional. |
| **`redis.tf`** | **Redis:** Aprovisiona el servicio de caché o base de datos en memoria. |
| **`grafana.tf`** | **Grafana:** Aprovisiona la instancia de Grafana para monitorización. |

### Secuencia de Aprovisionamiento (Guía Conceptual)

1.  Confirma la instalación de **Terraform** y la configuración de las credenciales.
2.  Dirígete a la carpeta **`iac`**.
3.  Inicializa los *backends* y módulos: `terraform init`
4.  Despliega la infraestructura: `terraform apply`
