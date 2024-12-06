# cleanup-docker.ps1
# *****************************************************************************
# *                            DOCKER CLEANUP SCRIPT                          *
# *****************************************************************************

Write-Host "Iniciando la limpieza de Docker..."

# Detener y eliminar todos los contenedores
Write-Host "Deteniendo y eliminando todos los contenedores..."
docker stop $(docker ps -aq) | Out-Null
docker rm $(docker ps -aq) | Out-Null

# Eliminar todas las imágenes
Write-Host "Eliminando todas las imágenes..."
docker rmi $(docker images -q) -f | Out-Null

# Eliminar todos los volúmenes
Write-Host "Eliminando todos los volúmenes..."
docker volume rm $(docker volume ls -q) | Out-Null

# Eliminar todas las redes excepto las predeterminadas
Write-Host "Eliminando todas las redes personalizadas..."
$networks = docker network ls -q | Where-Object { $_ -notmatch "bridge|host|none" }
if ($networks) {
    docker network rm $networks | Out-Null
} else {
    Write-Host "No hay redes personalizadas para eliminar."
}

# Eliminar todos los builds de Docker Buildx
Write-Host "Eliminando todos los builds..."
docker buildx prune -a -f | Out-Null

# Limpieza completa de elementos no utilizados
Write-Host "Realizando una limpieza completa de elementos no utilizados..."
docker system prune -a --volumes -f | Out-Null

Write-Host "Limpieza de Docker completada exitosamente."