import { paginate } from "../tools"
import { StateEntity } from "../entites"
import { StateRepository } from "../repositories"
import Joi from "joi"
import _ from "lodash"

export class StateService {
  private stateRepository: typeof StateRepository
  private user: any

  constructor(user?: any) {
    this.stateRepository = StateRepository
    this.user = user
  }

  static on(user?: any): StateService {
    return new StateService(user)
  }

  async find(id: number) {
    return this.stateRepository.findOne({ where: { id } })
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

    return await paginate(this.stateRepository, params)
  }

  async save(body: any) {

    let state = await this.find(body.id)

    if (!state) state = new StateEntity()

    Object.assign(state, _.omit(body, ["id"]))

    return await this.stateRepository.save(state)
  }

  async delete(id: number) {
    return await this.stateRepository.delete({ id })
  }
}
