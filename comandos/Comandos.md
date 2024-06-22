# Crear red: 
`
docker network create network_local_server
`

# Eliminar todo: 
`
docker stop $(docker ps -aq); docker rm $(docker ps -aq); docker rmi $(docker images -q); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q)
`

# Detener y eliminar todos los contenedores: 
`
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
`

# Eliminar todas las imágenes:
`
docker rmi $(docker images -q)
`

# Eliminar todos los volúmenes:
`
docker volume rm $(docker volume ls -q)
`

# Eliminar todas las redes:
`
docker network rm $(docker network ls -q)
`

# Construcción de docker:
`
docker-compose down
`

# Ejecución de docker:
`
docker-compose up -d --build
`