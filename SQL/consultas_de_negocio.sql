-- Calcular a média de preços de aluguel por categoria:
SELECT
    c.nome AS categoria,
    AVG(i.preco_aluguel) AS media_preco_aluguel
FROM mydb.imovel i
INNER JOIN mydb.localizacao l ON i.localizacao = l.idlocalizacao
INNER JOIN mydb.categoria c ON l.categoria = c.idcategoria
GROUP BY c.nome;

-- Listar todos os contratos de locação com vigência expirada:
SELECT
    idlocacao,
    inquilino,
    valor_contrato,
    vigencia,
    CURRENT_DATE AS data_atual,
    imovel,
    corretor
FROM mydb.locacao
WHERE vigencia < CURRENT_DATE;

-- Listar imóveis disponíveis para aluguel
SELECT
        i.idimovel,
        l.cep,
        l.numero_imovel,
        l.complemento,
        l.referencia,
        l.cidade,
        c.nome AS categoria,
        i.proprietario,
        i.preco_aluguel
    FROM
        imovel i
    LEFT JOIN
        locacao lo ON i.idimovel = lo.imovel
    JOIN
        localizacao l ON i.localizacao = l.idlocalizacao
    JOIN
        categoria c ON l.categoria = c.idcategoria
    WHERE
        lo.imovel IS NULL;
