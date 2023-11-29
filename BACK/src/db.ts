import * as dotenv from "dotenv"
import { DataSource } from "typeorm"
import { CategoryEntity, CityEntity, LocationEntity, LogEntity, PersonEntity, PropertyEntity, RentalEntity, StateEntity } from "./entites"

dotenv.config()

export const DB: DataSource = new DataSource({
  type: "mysql",
  host: "localhost",
  port: Number(process.env.DB_PORT),
  username: process.env.DB_USERNAME,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE,
  synchronize: true,
  migrationsRun: true,
  logging: true,
  logger: "debug",
  entities: [CategoryEntity, CityEntity, LocationEntity, LogEntity, PersonEntity, PropertyEntity, RentalEntity, StateEntity],
  migrations: [__dirname + "/**/migrations/*{.js,.ts}"],
})

DB.initialize()
  .then(() => console.log("Conectado ao banco de dados!"))
  .catch((err) => console.error("Não foi possivel conectar ao banco de dados", err))
