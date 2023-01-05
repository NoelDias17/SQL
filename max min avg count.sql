select top(100) * from FactSales

select sum(ReturnQuantity) as 'Total Devolvido'
from FactSales

select * from DimProduct

-- Contar total de linhas:
select count(*) as 'total de produtos'
from DimProduct

select count(Size)
from DimProduct

-- Count + Distinct tamb�m � muito utilizado
select count(distinct BrandName)
from DimProduct

select max(UnitPrice) as 'Pre�o Maximo' from DimProduct
select min(UnitPrice) as 'Pre�o Minimo' from DimProduct

-- Outra forma de escrever
select 
	max(UnitPrice) as 'Pre�o Maximo',
	min(UnitPrice) as 'Pre�o Minimo'
from 
	DimProduct

select avg(YearlyIncome) as media from DimCustomer