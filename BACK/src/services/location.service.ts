import { paginate } from "../tools"
import { LocationEntity } from "../entites"
import { LocationRepository } from "../repositories"
import Joi from "joi"
import _ from "lodash"

export class LocationService {
  private locationRepository: typeof LocationRepository
  private user: any

  constructor(user?: any) {
    this.locationRepository = LocationRepository
    this.user = user
  }

  static on(user?: any): LocationService {
    return new LocationService(user)
  }

  async find(id: number) {
    return this.locationRepository.findOne({ where: { id } })
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

    return await paginate(this.locationRepository, params)
  }

  async save(body: any) {

    let location = await this.find(body.id)

    if (!location) location = new LocationEntity()

    Object.assign(location, _.omit(body, ["id"]))

    return await this.locationRepository.save(location)
  }

  async delete(id: number) {
    return await this.locationRepository.delete({ id })
  }
}
