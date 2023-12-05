import { paginate } from "../tools"
import { PropertyEntity } from "../entites"
import { PropertyRepository } from "../repositories"
import Joi from "joi"
import _ from "lodash"

export class PropertyService {
  private propertyRepository: typeof PropertyRepository
  private user: any

  constructor(user?: any) {
    this.propertyRepository = PropertyRepository
    this.user = user
  }

  static on(user?: any): PropertyService {
    return new PropertyService(user)
  }

  async find(id: number) {
    return this.propertyRepository.findOne({ where: { id } })
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

    return await paginate(this.propertyRepository, params)
  }

  async save(body: any) {

    let property = await this.find(body.id)

    if (!property) property = new PropertyEntity()

    Object.assign(property, _.omit(body, ["id"]))

    return await this.propertyRepository.save(property)
  }

  async delete(id: number) {
    return await this.propertyRepository.delete({ id })
  }
}
