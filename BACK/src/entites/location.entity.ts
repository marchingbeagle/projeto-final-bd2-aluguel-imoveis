import { Column, CreateDateColumn, Entity, Generated, PrimaryColumn, UpdateDateColumn } from "typeorm"

@Entity("localizacao")
export class LocationEntity {
    @Generated("increment")
    @PrimaryColumn({ name: "idlocalizacao", type: "integer" })
    id: number

    @Column({ name: "cidade", type: "varchar" })
    idCity: string

    @Column({ name: "categoria", type: "varchar" })
    idCategory: string

    @Column({ name: "cep", type: "varchar" })
    cep: string

    @Column({ name: "numero_imovel", type: "varchar" })
    number: string

    @Column({ name: "complemento", type: "varchar", nullable: true })
    complement: string

    @Column({ name: "referencia", type: "varchar", nullable: true })
    reference: string

    @CreateDateColumn({ name: "created_at", update: false })
    createdAt: Date

    @UpdateDateColumn({ name: "updated_at", update: true })
    updatedAt: Date
}
