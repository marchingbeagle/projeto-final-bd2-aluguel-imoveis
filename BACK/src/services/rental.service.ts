import { paginate } from "../tools"
import { RentalEntity } from "../entites"
import { RentalRepository } from "../repositories"
import Joi from "joi"

export class RentalService {
  private rentalRepository: typeof RentalRepository
  private user: any

  constructor(user?: any) {
    this.rentalRepository = RentalRepository
    this.user = user
  }

  static on(user?: any): RentalService {
    return new RentalService(user)
  }

  async find(id: number) {
    return this.rentalRepository.findOne({ where: { id } })
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

    return await paginate(this.rentalRepository, params)
  }

  async save(data: any) {
    const body = await Joi.object({

    }).validateAsync(data)

    let rental = await this.find(body.id)

    if (!rental) rental = new RentalEntity()

    Object.assign(rental, body)

    return await this.rentalRepository.save(rental)
  }

  async delete(id: number) {
    return await this.rentalRepository.delete({ id })
  }
}
