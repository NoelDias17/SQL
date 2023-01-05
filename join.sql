select ProductKey, ProductName, ProductSubcategoryKey from DimProduct
select ProductSubcategoryKey, ProductSubcategoryName from DimProductSubcategory

select
-- Selecionar Colunas que v�o aparecer na tabela final
	ProductKey,
	ProductName,
	-- Quando a coluna estiver presente nas duas tabelas, importante especificar qual tabela antes do nome da coluna
	DimProduct.ProductSubcategoryKey,
	ProductSubcategoryName
from
	-- Qual � a tabela principal (Com mais informa��es)
	DimProduct
-- Qual � a tabela secund�ria, que ser� puxada (Com a informa��o �til)
inner join DimProductSubcategory
	-- nome da tabela.coluna em comum
	on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey

-- Mais usados s�o inner join e left join
-- Quando os 2 joins d�o o mesmo resultado significa que n�o tem ninguem da tabela da esquerda (DimProduct) que n�o exista na tabela da direita (DimProductSubcategory)

/* 
Left join:
Retorna todos as linhas da tabela principal, inclusive as que n�o tem correspondente na tabela secund�ria
inner join:
Retorna somente as linhas da tabela principal que tem correspondente nas duas tabelas
*/


