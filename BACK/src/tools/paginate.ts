export const paginate = async (repository: any, options: any) => {
    const [data, count] = await repository.findAndCount({
        select: options.fields ? options.fields.split(',') : undefined,
        relations: options.relations ? options.relations.split(',') : undefined,
        where: options.filters,
        order: options.order,
        take: options.limit,
        skip: Number(options.offset || 0) * Number(options.limit || 0)
    })

    const totalPage = Math.ceil(count / options.limit)

    const hasNext = Number(options.offset) < (totalPage - 1)

    return {
        totalPage: totalPage,
        total: count,
        hasNext: hasNext,
        content: data
    }
}