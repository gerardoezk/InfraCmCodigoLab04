# InfraCmCodigoLab05

🚀 Ansible + NGINX: Proyecto de Infraestructura como Código (IaC)
Este repositorio contiene un proyecto de 

Infraestructura como Código (IaC), probablemente para el laboratorio InfraCmCodigoLab05 (según el título), diseñado para desplegar y configurar un servidor NGINX utilizando Ansible. Además, incluye archivos de 

Terraform para provisionar otros componentes de infraestructura (bases de datos, proxies, etc.).

📂 Estructura del Proyecto
El proyecto está organizado en dos directorios principales: 

configuracion (para tareas de Ansible) e iac (para aprovisionamiento con Terraform).

Ansible + NGINX/
├── IAC-SEM5/
│   ├── configuracion/
│   │   ├── files/
│   │   │   ├── index1.html
│   │   │   ├── index2.html
│   │   │   └── index3.html       # Archivos estáticos para servir con NGINX [cite: 3, 4]
│   │   ├── templates/
│   │   │   └── nginx.conf        # Plantilla de configuración de NGINX con Jinja2 
│   │   ├── inventory.ini         # Inventario de Ansible (configurado para 'localhost' inicialmente) 
│   │   └── playbook.yaml         # Playbook principal de Ansible para la configuración 
│   └── iac/
│       ├── grafana.tf            # Terraform para Grafana [cite: 6]
│       ├── main.tf               # Configuración principal de Terraform [cite: 6]
│       ├── networks.tf           # Terraform para la configuración de red 
│       ├── nginx.tf              # Terraform para el aprovisionamiento de la instancia NGINX 
│       ├── postgre.tf            # Terraform para PostgreSQL 
│       ├── proxy.tf              # Terraform para un servicio proxy 
│       └── redis.tf              # Terraform para Redis 
└── README.md
🛠️ Configuración con Ansible
El directorio 

configuracion contiene el código de automatización para instalar y configurar NGINX en el servidor de destino.

Componentes Clave de Ansible
Archivo	Descripción
playbook.yaml	Define los pasos de automatización: instalar NGINX, copiar el archivo de configuración (nginx.conf) a partir de la plantilla y desplegar los archivos HTML estáticos (index*.html).
inventory.ini	
Define el host de destino. El snippet indica ejecución local: 

localhost ansible_connection=local.

templates/nginx.conf	
Plantilla 

Jinja2 (nginx.conf.j2) para generar la configuración final de NGINX.


Exportar a Hojas de cálculo
Ejecución del Playbook
Asegúrate de tener Ansible instalado.

Navega al directorio configuracion.

Ejecuta el playbook con el comando:

Bash

ansible-playbook -i inventory.ini playbook.yaml
☁️ Aprovisionamiento de Infraestructura con Terraform
El directorio iac contiene la configuración de Terraform para provisionar la infraestructura base necesaria, incluyendo servicios como bases de datos, caché y monitorización.

Servicios de Infraestructura
Archivo	Propósito
nginx.tf / main.tf	
Aprovisionamiento de la instancia donde se ejecutará NGINX y configuración principal.

networks.tf	
Definición de redes y subredes para los servicios.

postgre.tf	
Configuración del servicio de base de datos 

PostgreSQL.


redis.tf	
Configuración del servicio de caché 

Redis.

grafana.tf / proxy.tf	
Configuración de servicios auxiliares como 

Grafana (monitorización) y un posible Proxy/Load Balancer adicional.



Exportar a Hojas de cálculo
Pasos para Aprovisionar (Conceptual)
Asegúrate de tener Terraform instalado y las credenciales del proveedor de nube configuradas.

Navega al directorio iac.

Inicializa Terraform: terraform init

Aplica la configuración: terraform apply
