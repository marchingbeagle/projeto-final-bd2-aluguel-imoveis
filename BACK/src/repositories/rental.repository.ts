import { RentalEntity } from "../entites"
import { DB } from "../db"

export const RentalRepository = DB.getRepository(RentalEntity).extend({

})
