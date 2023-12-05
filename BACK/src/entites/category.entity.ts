import { Column, CreateDateColumn, Entity, Generated, PrimaryColumn, UpdateDateColumn } from "typeorm"

@Entity("categoria")
export class CategoryEntity {
    @Generated("increment")
    @PrimaryColumn({ name: "idcategoria", type: "integer" })
    id: number

    @Column({ name: "nome", type: "varchar" })
    name: string

    @Column({ name: "descricao", type: "varchar" })
    description: string

    @CreateDateColumn({ name: "data_criacao", update: false })
    createdAt: Date

    @UpdateDateColumn({ name: "data_atualizacao", update: true })
    updatedAt: Date
}
