import { FastifyInstance, FastifyReply, FastifyRequest } from "fastify"

import { ServerResponse } from "../tools"
import { LogService } from "../services"

export function RouterLog(
  router: FastifyInstance,
  options: any,
  done: () => void,
) {
  router.get("/:id", async (req: FastifyRequest, res: FastifyReply): Promise<any> => {
    const params = req.params as { id: number }

    return ServerResponse.wrapper(res, LogService.on().find(params.id))
  })

  router.get("/", async (req: FastifyRequest, res: FastifyReply): Promise<any> => {
    const params = req.query as any

    return ServerResponse.wrapper(res, LogService.on().retrieve(params))
  })

  router.post("/", async (req: FastifyRequest, res: FastifyReply): Promise<any> => {
    const body = req.body as any

    return ServerResponse.wrapper(res, LogService.on().save(body))
  })

  router.delete("/:id", async (req: FastifyRequest, res: FastifyReply): Promise<any> => {
    const params = req.params as { id: number }

    return ServerResponse.wrapper(res, LogService.on().delete(params.id))
  })

  done()
}
