import { FastifyInstance } from "fastify"
import { RouterCategory, RouterCity, RouterLocation, RouterLog, RouterPerson, RouterProperty, RouterRental, RouterState } from "./routers"

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
  router.register(RouterCategory, { prefix: "/category" })
  router.register(RouterLog, { prefix: "/log" })
  router.register(RouterRental, { prefix: "/rental" })

  done()
}
