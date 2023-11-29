import { PersonEntity } from "../entites"
import { DB } from "../db"

export const PersonRepository = DB.getRepository(PersonEntity).extend({

})
