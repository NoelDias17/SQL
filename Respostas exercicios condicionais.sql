-- exercicios condicionais

--1 a
select
	ProductKey, 
	ProductName,
	UnitPrice,
	case
		when ClassName = 'Economy' then UnitPrice * 0.05
		when ClassName = 'Regular' then UnitPrice * 0.07
		else UnitPrice * 0.09
	end as 'Desconto',
	case
		when ClassName = 'Economy' then UnitPrice - (UnitPrice * 0.05)
		when ClassName = 'Regular' then UnitPrice - (UnitPrice * 0.07)
		else UnitPrice - (UnitPrice * 0.09)
	end as 'Preço com Desconto'
from 
	DimProduct

-- b 

declare @varEconomy float
set @varEconomy = 0.05

declare @varRegular float
set @varRegular = 0.07

declare @varDeluxe float
set @varDeluxe = 0.09

select
	ProductKey, 
	ProductName,
	UnitPrice,
	case
		when ClassName = 'Economy' then UnitPrice * @varEconomy
		when ClassName = 'Regular' then UnitPrice * @varRegular
		else UnitPrice * @varDeluxe
	end as 'Desconto',
	case
		when ClassName = 'Economy' then UnitPrice - (UnitPrice * @varEconomy)
		when ClassName = 'Regular' then UnitPrice - (UnitPrice * @varRegular)
		else UnitPrice - (UnitPrice * @varDeluxe)
	end as 'Preço com Desconto'
from 
	DimProduct

-- 2
select 
	BrandName,
	count(*) as 'Quantidade Produtos/Marca',
	case
		when count(*) > 500 then 'CATEGORIA A'
		when count(*) > 100 and count(*) < 500 then 'CATEGORIA B'
		else 'CATEGORIA C'
	end as 'Categoria'
from 
	DimProduct
group by BrandName 
order by 'Quantidade Produtos/Marca' desc

-- 3

select *
from DimStore

select
	StoreName,
	sum(EmployeeCount) as 'Quantidade de Funcionarios',
	case
		when sum(EmployeeCount) >= 50 then 'Acima de 50 funcionários'
		when sum(EmployeeCount) >= 40 and count(*) < 500 then 'Entre 40 e 50 funcionários'
		when sum(EmployeeCount) >= 30 and count(*) < 500 then 'Entre 30 e 40 funcionários'
		when sum(EmployeeCount) >= 20 and count(*) < 500 then 'Entre 20 e 30 funcionários'
		when sum(EmployeeCount) >= 10 and count(*) < 500 then 'Entre 10 e 20 funcionários'
		else 'Abaixo de 10 funcionários'
	end as 'Categoria'
from
	DimStore
group by StoreName 
order by sum(EmployeeCount) desc

-- 4
select * from DimProduct

select 
	ProductSubcategoryName,
	avg(Weight)*100 as 'Peso Médio',
	case 
		when avg(Weight)*100 >= 1000	then 'Rota 2'
		else 'Rota 1'
	end as 'Rotas'
from 
	DimProduct
inner join DimProductSubcategory
	on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
group by ProductSubcategoryName
order by avg(Weight)*100 desc

select * from DimProductCategory
select * from DimProductSubcategory


-- 5
select 
	FirstName,
	Gender,
	TotalChildren,
	EmailAddress,
	case	
		when Gender = 'F' and TotalChildren > 0 then 'Sorteio Mãe do Ano'
		when Gender = 'M' and TotalChildren > 0 then 'Sorteio Pai do Ano'
		else 'Caminhão de Prêmios'
	end as 'Sorteio'
from 
	DimCustomer

-- 6
select 
	StoreName,
	OpenDate,
	CloseDate,
	case
		when CloseDate is null then datediff(day, OpenDate,getdate())
		else datediff(day, OpenDate,CloseDate)
	end as 'Dias Funcionando' 
from DimStore
order by 'Dias Funcionando' desc

select * from DimStore




