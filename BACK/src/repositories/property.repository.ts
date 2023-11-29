import { PropertyEntity } from "../entites"
import { DB } from "../db"

export const PropertyRepository = DB.getRepository(PropertyEntity).extend({

})
