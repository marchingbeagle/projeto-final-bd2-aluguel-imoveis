DELIMITER //

CREATE TRIGGER deletar_registro_log_pessoas BEFORE DELETE ON pessoas FOR EACH ROW BEGIN
    INSERT INTO log(titulo, descricao, data)
    VALUES (
        'Registro Deletado em pessoas',
        JSON_OBJECT('idpessoas', OLD.idpessoas, 'cpf', OLD.cpf, 'data_nascimento', OLD.data_nascimento, 'endereco', OLD.endereco, 'telefone', OLD.telefone, 'sexo', OLD.sexo),
        NOW()
    );
    DELETE FROM pessoas WHERE idpessoas = OLD.idpessoas; END;

CREATE TRIGGER deletar_registro_log_locacao BEFORE DELETE ON locacao FOR EACH ROW BEGIN
    INSERT INTO log(titulo, descricao, data)
    VALUES (
        'Registro Deletado em locacao',
        JSON_OBJECT('idlocacao', OLD.idlocacao, 'inquilino', OLD.inquilino, 'valor_contrato', OLD.valor_contrato, 'vigencia', OLD.vigencia, 'localizacao', OLD.localizacao, 'corretor', OLD.corretor, 'idimovel', OLD.idimovel),
        NOW()
    );
    DELETE FROM locacao WHERE idlocacao = OLD.idlocacao; END;

CREATE TRIGGER deletar_registro_log_localizacao BEFORE DELETE ON localizacao FOR EACH ROW BEGIN
    INSERT INTO log(titulo, descricao, data)
    VALUES (
        'Registro Deletado em localizacao',
        JSON_OBJECT('idlocalizacao', OLD.idlocalizacao, 'cep', OLD.cep, 'numero_imovel', OLD.numero_imovel, 'complemento', OLD.complemento, 'referencia', OLD.referencia, 'cidade', OLD.cidade, 'categoria', OLD.categoria),
        NOW()
    );
    DELETE FROM localizacao WHERE idlocalizacao = OLD.idlocalizacao; END;

CREATE TRIGGER deletar_registro_log_categoria BEFORE DELETE ON categoria FOR EACH ROW BEGIN
    INSERT INTO log(titulo, descricao, data)
    VALUES (
        'Registro Deletado em categoria',
        JSON_OBJECT('idcategoria', OLD.idcategoria, 'nome', OLD.nome, 'descricao', OLD.descricao, 'data_criacao', OLD.data_criacao, 'data_atualizacao', OLD.data_atualizacao),
        NOW()
    );
    DELETE FROM categoria WHERE idcategoria = OLD.idcategoria; END;

CREATE TRIGGER deletar_registro_log_cidade BEFORE DELETE ON cidade FOR EACH ROW BEGIN
    INSERT INTO log(titulo, descricao, data)
    VALUES (
        'Registro Deletado em cidade',
        JSON_OBJECT('idcidade', OLD.idcidade, 'nome', OLD.nome, 'estado', OLD.estado),
        NOW()
    );
    DELETE FROM cidade WHERE idcidade = OLD.idcidade; END;

CREATE TRIGGER deletar_registro_log_imovel BEFORE DELETE ON imovel FOR EACH ROW BEGIN
    INSERT INTO log(titulo, descricao, data)
    VALUES (
        'Registro Deletado em imovel',
        JSON_OBJECT('idimovel', OLD.idimovel, 'localizacao', OLD.localizacao, 'proprietario', OLD.proprietario, 'preco_compra', OLD.preco_compra, 'preco_aluguel', OLD.preco_aluguel),
        NOW()
    );
    DELETE FROM imovel WHERE idimovel = OLD.idimovel; END;

CREATE TRIGGER deletar_registro_log_estado BEFORE DELETE ON estado FOR EACH ROW BEGIN
    INSERT INTO log(titulo, descricao, data)
    VALUES (
        'Registro Deletado em estado',
        JSON_OBJECT('idestado', OLD.idestado, 'nome', OLD.nome, 'sigla', OLD.sigla),
        NOW()
    );
    DELETE FROM estado WHERE idestado = OLD.idestado; END;

CREATE TRIGGER deletar_registro_log_log
BEFORE DELETE ON log
FOR EACH ROW
BEGIN
    INSERT INTO log(titulo, descricao, data)
    VALUES (
        'Tentativa de Exclusão em log',
        JSON_OBJECT('idlog', OLD.idlog, 'titulo', OLD.titulo, 'descricao', OLD.descricao, 'data', OLD.data),
        NOW()
    );
END;

DELIMITER ;
