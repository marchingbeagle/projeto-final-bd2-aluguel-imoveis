import { CityEntity } from "../entites"
import { DB } from "../db"

export const CityRepository = DB.getRepository(CityEntity).extend({

})
