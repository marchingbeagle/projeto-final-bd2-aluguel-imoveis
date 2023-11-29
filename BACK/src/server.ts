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

const { HOST_VERSION, HOST_PORT } = process.env

const app = fastify()

const PORT = Number(HOST_PORT || 3027)
const VERSION = HOST_VERSION || "v1"

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
  port: PORT,
}

app.listen(listenOptions, (err: Error, address: string): void => {
  if (err) {
    console.error("Erro ao iniciar o servidor", err)
    process.exit(1)
  }
  console.log(`Servidor foi inicializado em ${address}`)
})
