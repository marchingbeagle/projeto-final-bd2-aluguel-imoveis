-- Calcular a média de preços de aluguel por categoria:
SELECT
    c.nome AS categoria,
    AVG(i.preco_aluguel) AS media_preco_aluguel
FROM mydb.imovel i
INNER JOIN mydb.localizacao l ON i.localizacao = l.idlocalizacao
INNER JOIN mydb.categoria c ON l.categoria = c.idcategoria
GROUP BY c.nome;