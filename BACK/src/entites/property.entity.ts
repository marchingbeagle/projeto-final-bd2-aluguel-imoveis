import { Column, CreateDateColumn, Entity, Generated, PrimaryColumn, UpdateDateColumn } from "typeorm"

@Entity("imovel")
export class PropertyEntity {
    @Generated("increment")
    @PrimaryColumn({ name: "idimovel", type: "integer" })
    id: number

    @Column({ name: "localizacao", type: "integer" })
    idLocation: number

    @Column({ name: "proprietario", type: "integer" })
    idOwner: number

    @Column({ name: "preco_compra", type: "integer" })
    purchasePrice: number

    @Column({ name: "preco_aluguel", type: "integer" })
    rentalPrice: number

    @CreateDateColumn({ name: "created_at", update: false })
    createdAt: Date

    @UpdateDateColumn({ name: "updated_at", update: true })
    updatedAt: Date
}
