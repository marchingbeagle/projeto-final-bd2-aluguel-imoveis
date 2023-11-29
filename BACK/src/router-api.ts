import { FastifyInstance } from "fastify"
import { RouterCity, RouterLocation, RouterPerson, RouterProperty, RouterState } from "./routers"

export default function router(
  router: FastifyInstance,
  options: any,
  done: () => void,
) {
  router.register(RouterCity, { prefix: "/city" })
  router.register(RouterLocation, { prefix: "/location" })
  router.register(RouterPerson, { prefix: "/person" })
  router.register(RouterProperty, { prefix: "/property" })
  router.register(RouterState, { prefix: "/state" })

  done()
}
