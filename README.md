# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
Para correr la aplicacion se esta usando
  rvm ruby 2.7.1
  rails 6.1.7
  node v16.20.2
  Sqlite3 momo base de datos

Para levantar el servidor correrlo con

  rails server
  o si con ip local rails s -b 127.0.0.1 -p 3000

Para acceder al las visas de las aplicacion
  Abrir en algun navegador e ir a localhost:3000 o si a la ip local
  este cargara en primera instancia la lista de carros

Destalles en Apis

  Registro de carro
    Listar todos los autos (GET ip:3000 o localhost:3000 /api/v1/cars)
    Ver detalles de un auto específico (GET ip:3000 o localhost:3000 /api/v1/cars/:id)
    Crear un nuevo auto (POST ip:3000 o localhost:3000 /api/v1/cars)
    Actualizar un auto (PUT/PATCH ip:3000 o localhost:3000 /api/v1/cars/:id)
    Eliminar un auto (DELETE ip:3000 o localhost:3000 /api/v1/cars/:id

  Mensajes de errr al registrar un carro con placas previamente registradas
    {
        "status": "Error",
        "data": {
            "plate_number": [
                "Estas placas ya fueron registradas con anterioridad"
            ]
        }
    }

    Mensajes de errr al registrar un carro con año fuera del rango entre 1900 y año en cuarso
      {
          "status": "Error",
          "data": {
              "year": [
                  "El año debe de ser entre 1900 y 2024"
              ]
          }
      }

  Registro de servicio
    Listar todos los servicios (GET ip:3000 o localhost:3000 /api/v1/maintenance_services)
    Ver detalles de un servicio específico (GET ip:3000 o localhost:3000 /api/v1/maintenance_services/:id)
    Crear un nuevo servicio de mantenimiento (POST ip:3000 o localhost:3000 /api/v1/maintenance_services)
    Actualizar un servicio (PUT/PATCH ip:3000 o localhost:3000 /api/v1/maintenance_services/:id)
    Eliminar un servicio (DELETE ip:3000 o localhost:3000 /api/v1/maintenance_services/:id)

    Mensajes de errr al registrar un servicio sin descripción
      {
          "status": "Error",
          "data": {
              "description": [
                  "Favor de ingresar una descripción"
              ]
          }
      }
