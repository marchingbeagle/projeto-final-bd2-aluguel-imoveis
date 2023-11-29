import { StateEntity } from "../entites"
import { DB } from "../db"

export const StateRepository = DB.getRepository(StateEntity).extend({

})
