import { FastifyInstance } from "fastify"

import { ServerResponse } from "./tools"

export default function router(
  router: FastifyInstance,
  options: any,
  done: () => void,
) {
  router.get("/check", async (req, res) => {
    return ServerResponse.wrapper(
      res,
      new Promise((resolve) => {
        resolve({ message: "OK" })
      }),
    )
  })

  router.get("/alive", async (req, res) => {
    return ServerResponse.wrapper(
      res,
      new Promise((resolve) => {
        resolve({ message: "OK" })
      }),
    )
  })

  done()
}
