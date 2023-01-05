-- exercicios modulo 5

-- 1
select top(100) * from FactSales

select
	sum(SalesQuantity) as 'Quantidade Vendida',
	sum(ReturnQuantity) as 'Quantidade Devolvida'
from
	FactSales
where channelKey = 1

select * from DimChannel

-- 2
select avg(YearlyIncome) as 'media salarial' from DimCustomer
where Occupation = 'Professional'	

-- 3
select * from DimStore

-- a
select max(EmployeeCount) as 'maximo de funcionarios' from DimStore

-- b
select
	top(1) StoreName,
	EmployeeCount
from
	DimStore
order by
	EmployeeCount desc

-- c
select min(EmployeeCount) as 'minimo de funcionarios' from DimStore

-- d
select
	top(1) StoreName,
	EmployeeCount
from
	DimStore
where EmployeeCount is not null
order by
	EmployeeCount asc

-- 4
-- a
select count(Gender) as 'Quantidade de Funcionarios' from DimEmployee
where Gender = 'M'

select count(Gender) as 'Quantidade de Funcionarias' from DimEmployee
where Gender = 'F'

-- b
select top(1) FirstName, EmailAddress, HireDate  from DimEmployee
where Gender = 'M'
order by HireDate asc

select top(1) FirstName, EmailAddress, HireDate  from DimEmployee
where Gender = 'F'
order by HireDate asc

-- 5
-- a
select Count(DISTINCT(ColorName)) as 'Quantidade de cores diferentes' from DimProduct

-- b
select Count(DISTINCT(BrandName)) as 'Quantidade de marcas diferentes' from DimProduct

-- c
select * from DimProduct

select Count(DISTINCT(ClassName)) as 'Quantidade de classes diferentes' from DimProduct
