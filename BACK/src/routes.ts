import { FastifyInstance } from "fastify"
import RouterApi from "./router-api"
import RouterHealth from "./router-health"

export default function router(
  router: FastifyInstance,
  options: any,
  done: () => void,
) {
  router.register(RouterApi, { prefix: "/api" })
  router.register(RouterHealth, { prefix: "/health" })

  done()
}
