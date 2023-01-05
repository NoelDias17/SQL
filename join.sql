select ProductKey, ProductName, ProductSubcategoryKey from DimProduct
select ProductSubcategoryKey, ProductSubcategoryName from DimProductSubcategory

select
-- Selecionar Colunas que vão aparecer na tabela final
	ProductKey,
	ProductName,
	-- Quando a coluna estiver presente nas duas tabelas, importante especificar qual tabela antes do nome da coluna
	DimProduct.ProductSubcategoryKey,
	ProductSubcategoryName
from
	-- Qual é a tabela principal (Com mais informações)
	DimProduct
-- Qual é a tabela secundária, que será puxada (Com a informação útil)
inner join DimProductSubcategory
	-- nome da tabela.coluna em comum
	on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey

-- Mais usados são inner join e left join
-- Quando os 2 joins dão o mesmo resultado significa que não tem ninguem da tabela da esquerda (DimProduct) que não exista na tabela da direita (DimProductSubcategory)

/* 
Left join:
Retorna todos as linhas da tabela principal, inclusive as que não tem correspondente na tabela secundária
inner join:
Retorna somente as linhas da tabela principal que tem correspondente nas duas tabelas
*/


