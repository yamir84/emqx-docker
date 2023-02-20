# EMQX CON DOCKER - IOTHOST.ORG

## Crear nuestro servicio de mqtt desde docker compose.

### Instalar los servicios.

1- Instalar docker en Ubuntu, página oficial de Docker
```
https://docs.docker.com/engine/install/ubuntu/#install-from-a-package
```
2- Instalar docker-compose en Ubuntu
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```
```
sudo chmod +x /usr/local/bin/docker-compose
```
Verificar instalación de Docker y docker-compose
```
sudo docker --version
```
```
sudo docker-compose --version
```
3- Clonar el repositorio
```
sudo git clone https://github.com/yamir84/emqx-docker.git
```
4- Entrar a la carpeta descargada
```
cd emqx-docker
```
5- Crear el archivo _.env_
```
sudo nano .env
```
6- Definir las variables de entorno en el archivo _.env_
```
MARIADB_ROOT_PASSWORD=emqxpass
MARIADB_USER=emqxuser
MARIADB_PASSWORD=emqxpass
MARIADB_DATABASE=emqx 
```
7- Ejecutar el comando para correr el servicio
```
sudo docker-compose up -d
```