import { FastifyReply } from "fastify"

class ServerResponse {
  static wrapper = async (
    res: FastifyReply,
    promise: Promise<any>,
  ): Promise<any> => {
    return promise
      .then((data) => {
        res.status(200).send(data)
      })
      .catch((err) => {
        const status = err.statusCode || 422

        if (err.response && err.response.data) {
          return res.status(status).send(err.response.data)
        }

        return res.status(status).send(err)
      })
  }
}

export { ServerResponse }
