-- a formata��o correta do select � conforme est� o c�digo abaixo

SELECT 
	*
FROM 
	DimCustomer

-- estes dois tra�os servem para criar um coment�rio

/*select 
	storekey, 
	StoreName, 
	storephone*/
	
-- outra forma de comentar � conforme foi feito acima com * e barras

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

-- comando "top" muito util para otimizar a visualiza��o de tabelas

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