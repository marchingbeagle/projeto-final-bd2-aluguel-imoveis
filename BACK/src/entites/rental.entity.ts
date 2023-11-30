import { Column, CreateDateColumn, Entity, Generated, PrimaryColumn, UpdateDateColumn } from "typeorm"

@Entity("locacao")
export class RentalEntity {
    @Generated("increment")
    @PrimaryColumn({ name: "idlocacao", type: "integer" })
    id: number

    @Column({ name: "inquilino", type: "integer" })
    idTenant: number

    @Column({ name: "localizacao", type: "integer" })
    idLocation: number

    @Column({ name: "corretor", type: "integer" })
    idBroker: number

    @Column({ name: "valor_contrato", type: "integer" })
    contractValue: number

    @Column({ name: "vigencia", type: "datetime" })
    validity: number

    @CreateDateColumn({ name: "created_at", update: false })
    createdAt: Date

    @UpdateDateColumn({ name: "updated_at", update: true })
    updatedAt: Date
}
