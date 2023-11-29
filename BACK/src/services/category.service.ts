import { paginate } from "../tools"
import { CategoryEntity } from "../entites"
import { CategoryRepository } from "../repositories"
import Joi from "joi"

export class CategoryService {
  private categoryRepository: typeof CategoryRepository
  private user: any

  constructor(user?: any) {
    this.categoryRepository = CategoryRepository
    this.user = user
  }

  static on(user?: any): CategoryService {
    return new CategoryService(user)
  }

  async find(id: number) {
    return this.categoryRepository.findOne({ where: { id } })
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

    return await paginate(this.categoryRepository, params)
  }

  async save(data: any) {
    const body = await Joi.object({

    }).validateAsync(data)

    let category = await this.find(body.id)

    if (!category) category = new CategoryEntity()

    Object.assign(category, body)

    return await this.categoryRepository.save(category)
  }

  async delete(id: number) {
    return await this.categoryRepository.delete({ id })
  }
}
