# InfraCmCodigoLab05

# INTEGRANTES:

Caipo Trujillo, Sonia Fernanda
Leyva Sandoval, Piero Alejandro 
Asunción Chira, Luis Gerardo 
Rodriguez Malca, Rodrigo Abel
Vera Romero, Vanesa Marili 

# InfraCmCodigoLab05: Ansible + NGINX con Terraform (IaC)

Este repositorio contiene un proyecto de **Infraestructura como Código (IaC)**, diseñado para desplegar la infraestructura base con **Terraform** y luego configurar un servidor **NGINX** como servidor web/proxy utilizando **Ansible**.

---

## Estructura del Proyecto

El proyecto está organizado en dos directorios principales: **`configuracion`** (para la automatización con Ansible) e **`iac`** (para el aprovisionamiento con Terraform).


Ansible + NGINX/

├── IAC-SEM5/

│   ├── configuracion/

│   │   ├── files/
│   │   │   ├── index1.html       # Archivo estático 

│   │   │   ├── index2.html       # Archivo estático 

│   │   │   └── index3.html       # Archivo estático 


│   │   ├── templates/
│   │   │   └── nginx.conf        # Plantilla de configuración de NGINX
│   │   ├── inventory.ini         # Inventario de Ansible (localhost por defecto)
│   │   └── playbook.yaml         # Playbook principal de Ansible
│   └── iac/
│       ├── grafana.tf            # Terraform para Grafana 

│       ├── main.tf               # Configuración principal de Terraform 

│       ├── networks.tf           # Terraform para configuración de red 

│       ├── nginx.tf              # Terraform para la instancia NGINX 

│       ├── postgre.tf            # Terraform para PostgreSQL 

│       ├── proxy.tf              # Terraform para un servicio proxy 

│       └── redis.tf              # Terraform para Redis 


└── README.md


---

## 🛠️ Configuración con Ansible

El directorio `configuracion` contiene el código de automatización para **instalar y configurar NGINX** en el servidor de destino[cite: 10].

### Componentes Clave de Ansible

| Archivo | Propósito | Contenido Inferido |
| :--- | :--- | :--- |
| **`playbook.yaml`** | Orquestación de tareas. | Instalar NGINX, copiar configuración (`nginx.conf`) y archivos estáticos (`index*.html`). |
| **`inventory.ini`** | Define el host. | `localhost ansible_connection=local`  (Ejecución local) |
| **`templates/`** | Contiene plantillas. | `nginx.conf` (Plantilla Jinja2) para la configuración de NGINX. |
| **`files/`** | Contiene archivos estáticos. | Los archivos HTML que NGINX servirá[cite: 3, 4]. |

### Ejecución del Playbook

1.  Asegúrate de tener **Ansible instalado**.
2.  Navega al directorio **`configuracion`**.
3.  Ejecuta el playbook:

    ```bash
    ansible-playbook -i inventory.ini playbook.yaml
    ```

---

## ☁️ Aprovisionamiento de Infraestructura con Terraform

El directorio **`iac`** contiene la configuración de **Terraform** para provisionar los recursos subyacentes en la nube o local.

### Servicios de Infraestructura

| Archivo | Descripción del Recurso |
| :--- | :--- |
| `nginx.tf` | Aprovisiona la VM o contenedor para NGINX. |
| `postgre.tf` | Aprovisiona el servicio de base de datos **PostgreSQL**. |
| `redis.tf` | Aprovisiona el servicio de caché o base de datos en memoria **Redis**. |
| `grafana.tf` | Aprovisiona la instancia de **Grafana** para monitorización. |
| `networks.tf` | Define la configuración de redes y subredes. |

### Pasos para Aprovisionar (Conceptual)

1.  Asegúrate de tener **Terraform instalado** y las credenciales configuradas.
2.  Navega al directorio **`iac`**.
3.  Inicializa Terraform: `terraform init`
4.  Aplica la configuración: `terraform apply`

---
