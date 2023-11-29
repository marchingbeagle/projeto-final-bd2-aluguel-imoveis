import { Column, CreateDateColumn, Entity, Generated, PrimaryColumn, UpdateDateColumn } from "typeorm"

@Entity("pessoas")
export class PersonEntity {
    @Generated("increment")
    @PrimaryColumn({ name: "idpessoas", type: "integer" })
    id: number

    @Column({ name: "nome", type: "varchar" })
    name: string

    @Column({ name: "cpf", type: "varchar" })
    cpf: string

    @Column({ name: "data_nascimento", type: "datetime" })
    birthdate: string

    @Column({ name: "endereco", type: "varchar" })
    address: string

    @Column({ name: "telefone", type: "varchar" })
    phone: string

    @Column({ name: "sexo", type: "varchar" })
    gender: string

    @CreateDateColumn({ name: "created_at", update: false })
    createdAt: Date

    @UpdateDateColumn({ name: "updated_at", update: true })
    updatedAt: Date
}
