-- a formatação correta do select é conforme está o código abaixo

SELECT 
	*
FROM 
	DimCustomer

-- estes dois traços servem para criar um comentário

/*select 
	storekey, 
	StoreName, 
	storephone*/
	
-- outra forma de comentar é conforme foi feito acima com * e barras

select
	*
from 
	DimStore

-- comando select seleciona todas as linhas da tabela, 
-- independente das colunas selecionadas

-- para retornar apenas as 10 primeiras linhas (top) N da tabela de produtos:

select top(10) * from DimProduct

-- para retornar apenas as 10% primeiras linhas (top) percent da tabela de clientes:

select top(10) percent * from DimCustomer

-- comando "top" muito util para otimizar a visualização de tabelas

select * from DimProduct

-- comando distinct retorna todos os valores distintos de uma coluna
select distinct colorname from DimProduct

select 
	distinct departmentname 
from 
	DimEmployee

-- Comando AS : renomeando colunas

select 
	FirstName as 'primeiro nome', 
	LastName as 'ultimo nome'

from
	DimCustomer