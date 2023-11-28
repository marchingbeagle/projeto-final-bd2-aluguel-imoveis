-- INSERT statements for mydb.estado
INSERT INTO mydb.estado (idestado, nome_estado, sigla_estado)
VALUES
(1, 'São Paulo', 'SP'),
(2, 'Rio de Janeiro', 'RJ'),
(3, 'Minas Gerais', 'MG'),
(4, 'Bahia', 'BA'),
(5, 'Paraná', 'PR'),
(6, 'Santa Catarina', 'SC'),
(7, 'Rio Grande do Sul', 'RS'),
(8, 'Ceará', 'CE'),
(9, 'Pernambuco', 'PE'),
(10, 'Amazonas', 'AM');


-- INSERT statements for mydb.cidade
INSERT INTO mydb.cidade (idcidade, nome, estado)
VALUES
(1, 'São Paulo', 1),
(2, 'Rio de Janeiro', 2),
(3, 'Belo Horizonte', 3),
(4, 'Salvador', 4),
(5, 'Curitiba', 5),
(6, 'Florianópolis', 6),
(7, 'Porto Alegre', 7),
(8, 'Fortaleza', 8),
(9, 'Recife', 9),
(10, 'Manaus', 10);


-- INSERT statements for mydb.categoria
INSERT INTO mydb.categoria (idcategoria, nome, descricao, data_criacao, data_atualizacao)
VALUES
(1, 'Residencial', 'Casas e apartamentos para moradia', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
(2, 'Comercial', 'Imóveis para fins comerciais', '2023-01-02 00:00:00', '2023-01-02 00:00:00'),
(3, 'Industrial', 'Áreas para indústrias', '2023-01-03 00:00:00', '2023-01-03 00:00:00'),
(4, 'Rural', 'Terrenos e fazendas', '2023-01-04 00:00:00', '2023-01-04 00:00:00'),
(5, 'Condomínio', 'Unidades em condomínios fechados', '2023-01-05 00:00:00', '2023-01-05 00:00:00'),
(6, 'Compartilhado', 'Espaços compartilhados', '2023-01-06 00:00:00', '2023-01-06 00:00:00'),
(7, 'Turismo', 'Imóveis para aluguel por temporada', '2023-01-07 00:00:00', '2023-01-07 00:00:00'),
(8, 'Esportivo', 'Áreas para práticas esportivas', '2023-01-08 00:00:00', '2023-01-08 00:00:00'),
(9, 'Educacional', 'Imóveis para instituições educacionais', '2023-01-09 00:00:00', '2023-01-09 00:00:00'),
(10, 'Saúde', 'Imóveis para instituições de saúde', '2023-01-10 00:00:00', '2023-01-10 00:00:00');


-- INSERT statements for mydb.localizacao
INSERT INTO mydb.localizacao (idlocalizacao, cep, numero_imovel, complemento, referencia, cidade, categoria)
VALUES
(1, '12345678', '101', 'Bloco A', 'Próximo ao shopping', 1, 1),
(2, '87654321', '202', 'Andar 3', 'Ao lado da praça', 2, 2),
(3, '54321876', '303', 'Perto da estação', 'Em frente à escola', 3, 3),
(4, '23456789', '404', 'Casa verde', 'Ao lado do parque', 4, 4),
(5, '87654321', '505', 'Edifício Sol', 'Próximo à academia', 5, 5),
(6, '34567890', '606', 'Apartamento Ouro', 'Perto do centro', 6, 6),
(7, '78901234', '707', 'Casa azul', 'Ao lado do mercado', 7, 7),
(8, '12345678', '808', 'Bloco B', 'Em frente à padaria', 8, 8),
(9, '98765432', '909', 'Cobertura Luxo', 'Próximo à praia', 9, 9),
(10, '54321876', '1010', 'Edifício Diamante', 'Perto do hospital', 10, 10);


-- INSERT statements for mydb.log
INSERT INTO mydb.log (idlog, titulo, descricao, data)
VALUES
(1, 'Aviso', 'Novo contrato assinado', '2023-01-03 00:00:00'),
(2, 'Alerta', 'Pagamento atrasado', '2023-01-04 00:00:00'),
(3, 'Notificação', 'Visita agendada', '2023-01-05 00:00:00'),
(4, 'Aviso', 'Mudança de locatário', '2023-01-06 00:00:00'),
(5, 'Alerta', 'Manutenção necessária', '2023-01-07 00:00:00'),
(6, 'Notificação', 'Proposta recebida', '2023-01-08 00:00:00'),
(7, 'Aviso', 'Reforma agendada', '2023-01-09 00:00:00'),
(8, 'Alerta', 'Vistoria pendente', '2023-01-10 00:00:00'),
(9, 'Notificação', 'Novo imóvel cadastrado', '2023-01-11 00:00:00'),
(10, 'Aviso', 'Contrato renovado', '2023-01-12 00:00:00');


-- INSERT statements for mydb.pessoas
INSERT INTO mydb.pessoas (idpessoas, nome, cpf, data_nascimento, endereco, telefone, sexo)
VALUES
(1, 'João Silva', '12345678901', '1990-05-15 00:00:00', 'Rua A, 123', '123456789', 'M'),
(2, 'Maria Oliveira', '98765432109', '1985-08-22 00:00:00', 'Avenida B, 456', '987654321', 'F'),
(3, 'Carlos Santos', '11122233344', '1988-12-10 00:00:00', 'Rua C, 789', '111222333', 'M'),
(4, 'Ana Pereira', '55566677788', '1995-04-05 00:00:00', 'Avenida D, 1011', '555666777', 'F'),
(5, 'Pedro Souza', '99988877766', '1980-09-30 00:00:00', 'Rua E, 1213', '999888777', 'M'),
(6, 'Fernanda Lima', '44433322211', '1992-06-20 00:00:00', 'Avenida F, 1415', '444333222', 'F'),
(7, 'Ricardo Rocha', '77788899900', '1983-11-25 00:00:00', 'Rua G, 1617', '777888999', 'M'),
(8, 'Camila Oliveira', '22211144455', '1998-03-15 00:00:00', 'Avenida H, 1819', '222111444', 'F'),
(9, 'Gabriel Silva', '66655544433', '1987-07-05 00:00:00', 'Rua I, 2021', '666555444', 'M'),
(10, 'Mariana Santos', '33322211100', '1994-01-10 00:00:00', 'Avenida J, 2223', '333222111', 'F');


-- INSERT statements for mydb.imovel
INSERT INTO mydb.imovel (idimovel, localizacao, proprietario, preco_compra, preco_aluguel)
VALUES
(1, 1, 1, 300000, 2000),
(2, 2, 2, 500000, 2500),
(3, 3, 3, 150000, 1200),
(4, 4, 4, 700000, 3000),
(5, 5, 5, 250000, 1800),
(6, 6, 6, 400000, 2200),
(7, 7, 7, 180000, 1500),
(8, 8, 8, 600000, 2800),
(9, 9, 9, 350000, 2000),
(10, 10, 10, 450000, 2300),
(11, 1, 1, 320000, 2100),
(12, 1, 2, 280000, 1900),
(13, 2, 3, 550000, 2700),
(14, 2, 4, 480000, 2300),
(15, 3, 5, 160000, 1300),
(16, 3, 6, 140000, 1100),
(17, 4, 7, 720000, 3200),
(18, 4, 8, 680000, 3000),
(19, 5, 9, 260000, 1900),
(20, 5, 1, 280000, 2000);


-- INSERT statements for mydb.locacao
INSERT INTO mydb.locacao (idlocacao, inquilino, valor_contrato, vigencia, localizacao, corretor)
VALUES
(1, 1, 1500, '2023-01-01 00:00:00', 1, 2),
(2, 2, 2000, '2023-02-01 00:00:00', 2, 3),
(3, 3, 1200, '2023-03-01 00:00:00', 3, 4),
(4, 4, 2500, '2023-04-01 00:00:00', 4, 5),
(5, 5, 1800, '2023-05-01 00:00:00', 5, 6),
(6, 6, 2200, '2023-06-01 00:00:00', 6, 7),
(7, 7, 1500, '2023-07-01 00:00:00', 7, 8),
(8, 8, 2800, '2023-08-01 00:00:00', 8, 9),
(9, 9, 2000, '2023-09-01 00:00:00', 9, 10),
(11, 11, 2050, '2023-11-01 00:00:00', 1, 1),
(12, 12, 1900, '2023-12-01 00:00:00', 1, 2),
(13, 13, 2600, '2024-01-01 00:00:00', 2, 3),
(14, 14, 2300, '2024-02-01 00:00:00', 2, 4),
(15, 15, 1250, '2024-03-01 00:00:00', 3, 5),
(16, 16, 1100, '2024-04-01 00:00:00', 3, 6),
(17, 17, 3100, '2024-05-01 00:00:00', 4, 7),
(18, 18, 2900, '2024-06-01 00:00:00', 4, 8),
(19, 19, 1950, '2024-07-01 00:00:00', 5, 9),
(20, 20, 2100, '2024-08-01 00:00:00', 5, 10);