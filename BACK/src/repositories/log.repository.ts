import { LogEntity } from "../entites"
import { DB } from "../db"

export const LogRepository = DB.getRepository(LogEntity).extend({

})
