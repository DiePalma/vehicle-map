# README

Pre-requisitos:


* WSL o distribución de Linux

* Ruby versión 3.3.0

* Rails versión 7.1.5

* PostgreSQL versión 14.13

* Redis server versión 7.4.1

Dentro de la carpeta vehicle-map, ejecutar en la terminal:

```
bundle install
```
para instalar las gemas, especialmente la de sidekiq y la de redis.
Se verifica la creacion y existencia de la base de datos con

```
rails:db migrate
```
Para permitir que redis se inicie automáticamente con el sistema, se autoriza con el comando: 
```
sudo snap set redis service.start=true
```
Para correr rails:
```
rails server
```
en otro terminal, se debe correr sidekiq para recibir posts en la API
```
bundle exec sidekiq
```
La aplicación debe funcionar adecuadamente, recibiendo solicitudes post para ingresar un nuevo waypoint a la ruta
```
/api/v1/gps
```
y solicitudes get a la ruta, 
```
/api/v1/show
```
para mostrar el último waypoint de cada vehículo.
