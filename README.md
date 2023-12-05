## Projeto banco de dados: Aluguel de imóveis. 🏠

## Integrantes
Erik Schneider - @marchingbeagle<br>
Renan Henriques - @renanhrqs<br>
Gustavo Valsechi - @gustavo-valsechi<br>
Gabriel Duarte - @GabrielWDuarte<br>
Dauane Neves - @dauaneneves<br>
Raul Fonseca - @castroderaul23

## Modelo Físico

Utilizamos a ferramenta de modelagem de dados MySQL Workbench para criação do modelo físico do banco de dados, para posterior exportação dos scripts DDL das tabelas e relacionamentos.<br>
arquivo fonte: [Modelo físico](https://github.com/marchingbeagle/projeto-final-bd2-aluguel-imoveis/blob/main/SQL/modelofisico.mwb).


![Captura de tela 2023-12-05 122332](https://github.com/marchingbeagle/projeto-final-bd2-aluguel-imoveis/assets/110925995/c51d5ae4-6626-4909-8417-ffa38577fd46)


## Dicionário de dados
As informações sobre as tabelas e índices foram documentados na planilha [template imovel](https://github.com/marchingbeagle/projeto-final-bd2-aluguel-imoveis/blob/main/dicionario_dados_locadora_im%C3%B3vel.xlsx).

## Scripts SQL
+ DDL [ddl.sql](https://github.com/marchingbeagle/projeto-final-bd2-aluguel-imoveis/blob/main/SQL/comandos%20ddl.sql).
+ DML [dml.sql](https://github.com/marchingbeagle/projeto-final-bd2-aluguel-imoveis/blob/main/SQL/comandos_dml.sql).
+ Triggers [triggers.sql](https://github.com/marchingbeagle/projeto-final-bd2-aluguel-imoveis/blob/main/SQL/trigger.sql).
+ Stored procedures [storedprocedures.sql](https://github.com/marchingbeagle/projeto-final-bd2-aluguel-imoveis/blob/main/SQL/sprocedure_imoveis_disponiveis.sql).
+ Consultas [consultas.sql](https://github.com/marchingbeagle/projeto-final-bd2-aluguel-imoveis/blob/main/SQL/consultas_de_negocio.sql).



## CRUD
Criamos um servidor em typescript utilizando a biblioteca fastify para as chamadas http. 
Para a manipulação dos dados do banco, aderimos a biblioteca typeORM, onde comunicamos o servidor com o banco de dados MySQL. 
Por fim, para a demonstração do CRUD, criamos as rotas do servidor na plataforma Postman.
