import { paginate } from "../tools"
import { LogEntity } from "../entites"
import { LogRepository } from "../repositories"
import Joi from "joi"

export class LogService {
  private logRepository: typeof LogRepository
  private user: any

  constructor(user?: any) {
    this.logRepository = LogRepository
    this.user = user
  }

  static on(user?: any): LogService {
    return new LogService(user)
  }

  async find(id: number) {
    return this.logRepository.findOne({ where: { id } })
  }

  async retrieve(options: any) {
    const params = await Joi.object({
      limit: Joi.number().max(100).default(8),
      offset: Joi.number().default(0),
      fields: Joi.string().default(''),
      relations: Joi.string().default(''),
      filters: Joi.object().default({}),
      order: Joi.object().default({})
    }).validateAsync(options || {})

    return await paginate(this.logRepository, params)
  }

  async save(data: any) {
    const body = await Joi.object({

    }).validateAsync(data)

    let log = await this.find(body.id)

    if (!log) log = new LogEntity()

    Object.assign(log, body)

    return await this.logRepository.save(log)
  }

  async delete(id: number) {
    return await this.logRepository.delete({ id })
  }
}
