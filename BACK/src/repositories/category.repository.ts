import { CategoryEntity } from "../entites"
import { DB } from "../db"

export const CategoryRepository = DB.getRepository(CategoryEntity).extend({

})
