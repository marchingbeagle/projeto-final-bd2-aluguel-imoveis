import { Column, CreateDateColumn, Entity, Generated, PrimaryColumn, UpdateDateColumn } from "typeorm"

@Entity("log")
export class LogEntity {
    @Generated("increment")
    @PrimaryColumn({ name: "idlog", type: "integer" })
    id: number

    @Column({ name: "titulo", type: "varchar" })
    title: string

    @Column({ name: "descricao", type: "varchar" })
    description: string

    @CreateDateColumn({ name: "created_at", update: false })
    createdAt: Date

    @UpdateDateColumn({ name: "updated_at", update: true })
    updatedAt: Date
}
