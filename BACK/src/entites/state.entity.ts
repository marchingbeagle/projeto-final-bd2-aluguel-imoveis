import { Column, CreateDateColumn, Entity, Generated, PrimaryColumn, UpdateDateColumn } from "typeorm"

@Entity("estado")
export class StateEntity {
    @Generated("increment")
    @PrimaryColumn({ name: "idestado", type: "integer" })
    id: number

    @Column({ name: "nome_estado", type: "varchar" })
    name: string

    @Column({ name: "sigla_estado", type: "varchar" })
    abbreviation: string

    @CreateDateColumn({ name: "created_at", update: false })
    createdAt: Date

    @UpdateDateColumn({ name: "updated_at", update: true })
    updatedAt: Date
}
