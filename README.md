# Microservicio API SYNC

Micro servicio encargado de sincronizar los datos de la [web](https://covid19cubadata.github.io/), y la base de datos del bot.

## ¿Como fuciona?

El micro servico levanta un servicio http que espera una petición POST al endpoint `/sync`, cuando recibe una petición a este endpoint, el servicio se encarga de obtener el json de datos desde la web y calcular el hash del json para compararlo con el hash que tiene almacenado en la base de datos. Si los hash son diferentes, desglosa el json crudo y va guardando la  información en la base de datos un poco más segmentada.

El controlador del endpoint `/sync` espera un token secreto que debe ser enviado en la cabecera de la petición como `STOKEN` para segurarse de que no se hagan peticiones de sincronización constantemente de otros servicios o personas ajenas.

## Variables de entorno que deben ser configuradas

`DATA_URI`: Dirección del json de datos, ej (https://covid19cubadata.github.io/data/covid19-cuba.json)
`STOKEN`: Valor del token secreto, por defecto es `secret`, esto debe ser cambiado para mejor seguridad.
`BOT_URI`: Url del endpoint web que es utilizado por el microservicio del bot para enviar notificaciones. Se utiliza para notificar cuando los datos han sido actualizados. El endpoint en el bot es `/sync`, ej (https://covid19cuba-bot.herokuapp.com/sync)
`PORT`: Puerto donde va a correr el servicio, por defecto es 4000

## Instalación y ejecución
1. Clonar este repo.
2. Instalar dependencias de node: `yarn install` o `npm install`
3. Compilar de typescript a javascript: `yarn build` o `npm run build`
4. Ejecutar servicio: `yarn start` o `npm run start`
