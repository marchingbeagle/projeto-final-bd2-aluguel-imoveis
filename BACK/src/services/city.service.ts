import { paginate } from "../tools"
import { CityEntity } from "../entites"
import { CityRepository } from "../repositories"
import Joi from "joi"
import _ from "lodash"

export class CityService {
  private cityRepository: typeof CityRepository
  private user: any

  constructor(user?: any) {
    this.cityRepository = CityRepository
    this.user = user
  }

  static on(user?: any): CityService {
    return new CityService(user)
  }

  async find(id: number) {
    return this.cityRepository.findOne({ where: { id } })
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

    return await paginate(this.cityRepository, params)
  }

  async save(body: any) {

    let city = await this.find(body.id)

    if (!city) city = new CityEntity()

    Object.assign(city, _.omit(body, ["id"]))

    return await this.cityRepository.save(city)
  }

  async delete(id: number) {
    return await this.cityRepository.delete({ id })
  }
}
