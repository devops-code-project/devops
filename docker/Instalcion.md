# Instalación de PostgreSQL
# -------------------------
# Comando para crear el contenedor PostgreSQL
docker run --name serve-postgres -e POSTGRES_PASSWORD=abcd1234 -p 5432:5432 -d postgres
# Configuración:
# Host name/address: localhost
# Port: 5432
# Username: postgres
# Password: abcd1234

# Instalación de MySQL
# --------------------
# Comando para crear el contenedor MySQL
docker run --name serve-mysql -e MYSQL_ROOT_PASSWORD=abcd1234 -p 3306:3306 -d mysql
# Configuración:
# Host name/address: localhost
# Port: 3306
# Username: root
# Password: abcd1234

# Instalación de SQL Server
# -------------------------
# Comando para crear el contenedor SQL Server
docker run --name serve-sqlserver -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=abcd1234!' -p 1433:1433 -d mcr.microsoft.com/mssql/server:2019-latest
# Configuración:
# Host name/address: localhost
# Port: 1433
# Username: sa
# Password: abcd1234!

# Comandos útiles para Docker
# ---------------------------
# Listar contenedores en ejecución
docker ps

# Parar el contenedor
docker stop serve-sqlserver

# Iniciar el contenedor
docker start serve-sqlserver

# Eliminar el contenedor
docker rm serve-sqlserver

# Acceder al contenedor
docker exec -it serve-sqlserver bash
# Dentro del contenedor, puedes usar el cliente de línea de comandos de SQL Server:
# /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 'abcd1234!'

# Instalación de Ubuntu
# ---------------------
# Crear y ejecutar el contenedor Ubuntu en modo interactivo
docker run --name serve-ubuntu -it ubuntu

# Crear y ejecutar el contenedor en segundo plano
docker run --name serve-ubuntu -d ubuntu sleep infinity

# Acceder al contenedor en ejecución
docker exec -it serve-ubuntu bash

# Dentro del contenedor, actualizar los paquetes
apt-get update
apt-get upgrade -y

# Instalar paquetes adicionales si es necesario
apt-get install -y vim git curl

# Instalación de Apache en Ubuntu
# -------------------------------
# Detener y eliminar el contenedor existente (si aplica)
docker stop serve-ubuntu
docker rm serve-ubuntu

# Crear y ejecutar un nuevo contenedor con el puerto 80 mapeado
docker run --name serve-ubuntu -d -p 80:80 ubuntu sleep infinity

# Acceder al nuevo contenedor
docker exec -it serve-ubuntu bash

# Dentro del contenedor, actualizar los paquetes e instalar Apache
apt-get update
apt-get install -y apache2

# Iniciar Apache
service apache2 start

# Instalación de Apache y PHP con volumen montado en Ubuntu
# ---------------------------------------------------------
# Detener y eliminar el contenedor existente (si aplica)
docker stop serve-ubuntu
docker rm serve-ubuntu

# Crear y ejecutar un nuevo contenedor con el puerto 80 mapeado y un volumen montado
docker run --name serve-ubuntu -d -p 80:80 -v C:/www:/var/www/html ubuntu sleep infinity

# Acceder al contenedor
docker exec -it serve-ubuntu bash

# Dentro del contenedor, actualizar los paquetes e instalar Apache y PHP
apt-get update
apt-get install -y apache2 php libapache2-mod-php

# Reiniciar Apache
service apache2 restart
