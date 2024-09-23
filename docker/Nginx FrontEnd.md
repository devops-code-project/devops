
## Requisitos Previos

Asegúrate de tener Docker y Docker Compose instalados en tu máquina.

## Configuración

1. **Dockerfile**

    Este archivo se encuentra en la raíz del proyecto y tiene el siguiente contenido:

    ```Dockerfile
    FROM nginx:latest
    WORKDIR /usr/share/nginx/html
    COPY . .
    EXPOSE 80
    CMD ["nginx", "-g", "daemon off;"]
    ```

2. **docker-compose.yml**

    Este archivo se encuentra en la carpeta `devops` y tiene el siguiente contenido:

    ```yaml
    version: '3.8'
    services:
      web:
        build:
          context: ..
          dockerfile: Dockerfile
        ports:
          - "80:80"
        networks:
          - webnet

    networks:
      webnet:
    ```

## Construcción y Ejecución

1. **Navegar al directorio `devops`**:

    ```bash
    cd /ruta/a/tu/proyecto/GastroManager/devops
    ```

2. **Construir y levantar los contenedores**:

    ```bash
    docker-compose down
    docker-compose up -d --build
    ```

3. **Verificar que los contenedores están en ejecución**:

    ```bash
    docker ps
    ```

4. **Acceder al contenedor de Nginx** (opcional, para verificar la estructura de archivos):

    ```bash
    docker exec -it <container_id> bash
    ls -R /usr/share/nginx/html
    ```

    Reemplaza `<container_id>` con el ID del contenedor de Nginx.

## Acceso a la Aplicación

Una vez que los contenedores estén en funcionamiento, puedes acceder a la aplicación en tu navegador:




## Notas

- Asegúrate de que no haya otros servicios utilizando el puerto 80 antes de iniciar los contenedores.
- Si necesitas realizar cambios en los archivos, asegúrate de volver a construir la imagen con `docker-compose up --build`.

## Solución de Problemas

- **Error de puerto ocupado**: Si el puerto 80 está ocupado, puedes detener cualquier servicio que esté utilizando ese puerto o cambiar el puerto en el archivo `docker-compose.yml`.
- **Archivos no encontrados**: Verifica que todos los archivos se copian correctamente dentro del contenedor accediendo al contenedor y utilizando el comando `ls -R /usr/share/nginx/html`.

## Licencia

Este proyecto está licenciado bajo los términos de la licencia MIT.
