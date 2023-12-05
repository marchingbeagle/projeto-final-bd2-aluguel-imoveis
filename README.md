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


![imagem atualizada](https://github.com/marchingbeagle/projeto-final-bd2-aluguel-imoveis/assets/110925995/026d9ae6-eac4-455e-90aa-32cf6ee5ead6)

## Dicionário de dados
As informações sobre as tabelas e índices foram documentados na planilha [template1.xlsx](https://github.com/marchingbeagle/projeto-final-bd2-aluguel-imoveis/blob/main/template1.xlsx).


## CRUD
Criamos um servidor em typescript utilizando a biblioteca fastify para as chamadas http. 
Para a manipulação dos dados do banco, aderimos a biblioteca typeORM, onde comunicamos o servidor com o banco de dados MySQL. 
Por fim, para a demonstração do CRUD, criamos as rotas do servidor na plataforma Postman.
