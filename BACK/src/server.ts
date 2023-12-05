import fastify, {
  FastifyRequest,
  FastifyReply,
  FastifyInstance,
  HookHandlerDoneFunction,
  FastifyListenOptions,
} from "fastify"
import router from "./routes"
import fp from "fastify-plugin"
import * as process from "process"

import "./db"

const app = fastify()

app.register(
  fp(async (instance: FastifyInstance) => {
    instance.addHook(
      "onRequest",
      (
        req: FastifyRequest,
        res: FastifyReply,
        done: HookHandlerDoneFunction,
      ) => {
        console.log(`[${req.method}] - ${req.url}`)

        done()
      },
    )
  }),
)

app.register(router)

app.setNotFoundHandler((req: FastifyRequest, res: FastifyReply) => {
  res.code(404).send({ status: 404, message: "Recurso não encontrado!" })
})

const listenOptions: FastifyListenOptions = {
  port: 3027,
  host: "localhost"
}

app.listen(listenOptions, (err: Error, address: string): void => {
  if (err) {
    console.error("Erro ao iniciar o servidor", err)
    process.exit(1)
  }
  console.log(`Servidor foi inicializado em ${address}`)
})
