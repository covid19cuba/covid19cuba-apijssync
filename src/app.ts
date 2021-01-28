import { Request, ResponseToolkit, Server } from "@hapi/hapi"
import { syncController } from './sync.controller'

export const init = async () => {
    const server: Server = new Server({
        host: process.env.HOST || 'localhost',
        port: process.env.PORT || 4000,
    })

    server.route({
        method: 'GET',
        path: '/test',
        handler: (req: Request, h: ResponseToolkit) => {
            return h.response('Covid19 Cuba API')
        }
    })

    server.route({
        method: 'POST',
        path: '/sync',
        handler: syncController
    })

    await server.start()
    console.log('Server runing on %s', server.info.uri);
}