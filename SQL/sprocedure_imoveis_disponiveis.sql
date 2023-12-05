DELIMITER $$

DROP PROCEDURE ImoveisDisponiveis;

CREATE PROCEDURE ImoveisDisponiveis()
BEGIN
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
END $$

DELIMITER ;

call ImoveisDisponiveis()