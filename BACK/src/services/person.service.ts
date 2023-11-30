import { paginate } from "../tools"
import { PersonEntity } from "../entites"
import { PersonRepository } from "../repositories"
import Joi from "joi"

export class PersonService {
  private personRepository: typeof PersonRepository
  private user: any

  constructor(user?: any) {
    this.personRepository = PersonRepository
    this.user = user
  }

  static on(user?: any): PersonService {
    return new PersonService(user)
  }

  async find(id: number) {
    return this.personRepository.findOne({ where: { id } })
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

    return await paginate(this.personRepository, params)
  }

  async save(data: any) {
    const body = await Joi.object({

    }).validateAsync(data)

    let person = await this.find(body.id)

    if (!person) person = new PersonEntity()

    Object.assign(person, body)

    return await this.personRepository.save(person)
  }

  async delete(id: number) {
    return await this.personRepository.delete({ id })
  }
}
