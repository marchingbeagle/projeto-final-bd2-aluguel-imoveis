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