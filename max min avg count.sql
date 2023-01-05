select top(100) * from FactSales

select sum(ReturnQuantity) as 'Total Devolvido'
from FactSales

select * from DimProduct

-- Contar total de linhas:
select count(*) as 'total de produtos'
from DimProduct

select count(Size)
from DimProduct

-- Count + Distinct também é muito utilizado
select count(distinct BrandName)
from DimProduct

select max(UnitPrice) as 'Preço Maximo' from DimProduct
select min(UnitPrice) as 'Preço Minimo' from DimProduct

-- Outra forma de escrever
select 
	max(UnitPrice) as 'Preço Maximo',
	min(UnitPrice) as 'Preço Minimo'
from 
	DimProduct

select avg(YearlyIncome) as media from DimCustomer