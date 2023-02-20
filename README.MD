# EMQX CON DOCKER - IOTHOST.ORG

## Crear nuestro servicio de mqtt desde docker compose.

### Instalar los servicios.

1- Instalar docker en Ubuntu, pagina oficial de Docker
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
docker --version
```
```
docker-compose --version
```
3- Clonar el repositorio
```
git clone https://github.com/yamir84/emqx-docker.git
```
4- Entrar a la carpeta descargada
```
cd emqx-docker
```
5- Ejecutar el comando para correr el servicio
```
docker-compose up -d
```