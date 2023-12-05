import { Column, CreateDateColumn, Entity, Generated, PrimaryColumn, UpdateDateColumn } from "typeorm"

@Entity("cidade")
export class CityEntity {
    @Generated("increment")
    @PrimaryColumn({ name: "idcidade", type: "integer" })
    id: number

    @Column({ name: "estado", type: "integer" })
    idState: number

    @Column({ name: "nome", type: "varchar" })
    name: string
}
