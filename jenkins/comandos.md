# Paso 1: Ejecutar el Contenedor de Jenkins
Paso 1: Ejecutar el Contenedor de Jenkins

docker run -d -p 8081:8080 -p 50000:50000 --name jenkins -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts

-p 8081:8080: Mapea el puerto 8081 del host al puerto 8080 del contenedor Jenkins.
-p 50000:50000: Mapea el puerto 50000 (usado para agentes Jenkins).
-v jenkins_home:/var/jenkins_home: Monta un volumen para persistir los datos de Jenkins.

Paso 2: Configurar Jenkins
Abre tu navegador y ve a http://localhost:8081.
Sigue las instrucciones para desbloquear Jenkins y configurar el administrador.
Instala los plugins recomendados y adicionales como "Docker", "Git", y "GitHub".

2. Configurar un Pipeline de Jenkins
Paso 1: Crear un Pipeline en Jenkins
En el tablero de Jenkins, haz clic en "Nuevo Item".
Introduce un nombre para el proyecto y selecciona "Pipeline".
Configura el proyecto y, en la sección "Pipeline", elige "Pipeline script from SCM".
Selecciona "Git" y proporciona la URL de tu repositorio de GitHub.
Paso 2: Crear un Jenkinsfile en tu Repositorio
Crea un archivo Jenkinsfile en la raíz de tu repositorio con el siguiente contenido: