-- select * from DimProduct

select top(1) 
	ProductName, 
	UnitPrice 
from 
	DimProduct
order by UnitPrice desc

-- Quantos produtos tem um preço unitario menor que 1000

select 
	ProductName as 'produto', 
	UnitPrice as 'preço'
from 
	DimProduct
where
	UnitPrice >= 2000
order by 
	UnitPrice desc

Select 
	*
from 
	DimProduct
where

Select 
	*
from 
	DimProduct
where
	ColorName = 'Black' and -- para colocar mais de um filtro use 'or', 'and' e 'not'
	BrandName = 'Fabrikam'

select * from DimEmployee
where not DepartmentName = 'Marketing'

select * from DimCustomer
where BirthDate >= '1970-12-31' -- sempre utilizar este formato para filtrar datas
order by BirthDate asc

select * from DimEmployee
where not DepartmentName = 'Marketing' and not MaritalStatus = 'M'

-- Exercicio 1
select * from DimEmployee
where gender = 'F' and DepartmentName = 'Finance'

-- Exercicio 2
select * from DimProduct
where BrandName = 'Contoso' and ColorName = 'Red' and UnitPrice >= 100 

-- Exercicio 3
select * from DimProduct
where BrandName = 'Litware' or BrandName = 'Fabrikam' or ColorName = 'Black' 

-- Exercicio 4
select * from DimSalesTerritory
where SalesTerritoryGroup = 'Europe' and not SalesTerritoryCountry = 'Italy' 

-- Exemplo da aplicação dos parenteses, util para combinar or e and no mesmo filtro
-- Parenteses serve para priorizar qual filtro será aplicado primeiro
select * from DimProduct
where (ColorName = 'Black' or ColorName = 'Red') and BrandName = 'Fabrikam'

-- Para colocar mais de uma opção no 'or' use o 'in' conforme abaixo
select * from DimEmployee
where DepartmentName in ('Production','Marketing','Engineering')

-- Utilize o LIKE + a %porcentagem% antes e depois da palavra que vc quer verificar se tem na célula
-- util para verificar parte do texto
select * from DimProduct
where ProductName LIKE '%MP3 Player%'

-- apenas celulas que começam com o type
select * from DimProduct
where ProductDescription LIKE 'Type%'

-- apenas celulas que terminam com o WMA
select * from DimProduct
where ProductDescription LIKE '%WMA'

-- para pesquisar valores que estão entre x e y
select * from DimProduct
where UnitPrice BETWEEN 50 AND 100
ORDER BY UnitPrice DESC

-- mesma lógica só que ao contrário, selecionar valores que nao estão entre x e y
select * from DimProduct
where UnitPrice not BETWEEN 50 AND 100

-- between com datas
select * from DimEmployee
where HireDate between '2000-01-01' and '2000-12-31'

-- filtrando somente pessoas fisicas com is null
select * from DimCustomer
where CompanyName is null

-- filtrando somente empresas com is not null
select * from DimCustomer
where CompanyName is not null







