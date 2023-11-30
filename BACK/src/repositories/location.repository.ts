import { LocationEntity } from "../entites"
import { DB } from "../db"

export const LocationRepository = DB.getRepository(LocationEntity).extend({

})
