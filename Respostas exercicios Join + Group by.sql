
-- 1 a)
select 
	ChannelName,
	sum(SalesQuantity) as 'soma de vendas'
from
	FactSales
inner join DimChannel
	on FactSales.channelKey = DimChannel.ChannelKey
group by ChannelName
order by 'soma de vendas' desc

-- b
select 
	StoreName,
	sum(SalesQuantity) as 'Total Vendido',
	sum(ReturnQuantity) as 'Total Devolvido'
from
	FactSales
inner join DimStore
	on FactSales.StoreKey = DimStore.StoreKey
group by StoreName

-- c

select top(100) * from FactSales
select * from DimDate

select
	CalendarMonthLabel,
	CalendarYear,
	CalendarMonth,
	sum(SalesAmount) as 'Total Vendido'
from
	FactSales
inner join DimDate
	on FactSales.DateKey = DimDate.Datekey
group by CalendarYear, CalendarMonthLabel, CalendarMonth
order by CalendarMonth asc


select
	CalendarYear,
	sum(SalesAmount) as 'Total Vendido'
from
	FactSales
inner join DimDate
	on FactSales.DateKey = DimDate.Datekey
group by CalendarYear
order by 'Total Vendido' desc

-- 2
-- a)
select
	ColorName,
	sum(SalesQuantity) as 'Total Vendido'
from
	FactSales
inner join DimProduct
	on FactSales.ProductKey = DimProduct.ProductKey
group by ColorName
order by 'Total Vendido' desc

-- b)
select
	-- ProductName,
	ColorName,
	sum(SalesQuantity) as 'Total Vendido'
from
	FactSales
inner join DimProduct
	on FactSales.ProductKey = DimProduct.ProductKey
group by ColorName
having sum(SalesQuantity) >= 3000000
order by 'Total Vendido' desc

-- 3
select
	ProductCategoryName,
	sum(SalesQuantity) as 'Qtd Vendida'
from
	FactSales
inner join DimProduct
	on FactSales.ProductKey = DimProduct.ProductKey
	inner join DimProductSubcategory
		on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
		inner join DimProductCategory
			on DimProductSubcategory.ProductCategoryKey =DimProductCategory.ProductCategoryKey
group by ProductCategoryName
order by 'Qtd Vendida' desc

select top(100) * from FactSales
select  * from DimProductCategory
select  * from DimProductSubcategory
select  * from DimProduct

-- 4
-- a)
select top(100) * from FactOnlineSales
select * from DimProduct

select top (1)
	DimCustomer.CustomerKey,
	FirstName,
	MiddleName,
	LastName,
	sum(SalesQuantity) as 'Total Vendido'
from
	FactOnlineSales
inner join DimCustomer
	on FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
where FirstName is not null
group by DimCustomer.CustomerKey, FirstName, MiddleName, LastName
order by sum(SalesQuantity) desc

-- b)

select top(10)
	ProductName,
	sum(SalesQuantity)
from 
	FactOnlineSales
inner join DimProduct
	on FactOnlineSales.ProductKey = DimProduct.ProductKey
where CustomerKey = 7665
group by ProductName
order by sum(SalesQuantity) desc

-- 5
select top(100) * from FactOnlineSales
select * from DimCustomer

select
	Gender,
	sum(SalesQuantity) as 'Total Vendido'
from
	FactOnlineSales
inner join DimCustomer
	on FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
where Gender is not null
group by Gender
order by sum(SalesQuantity) desc

-- 6 
select * from FactExchangeRate
select * from DimCurrency 

select
	CurrencyDescription,
	avg(AverageRate) as 'taxa de câmbio média'
from 
	FactExchangeRate
inner join DimCurrency
	on FactExchangeRate.CurrencyKey = DimCurrency.CurrencyKey
group by CurrencyDescription
having avg(AverageRate) between 10 and 100

-- 7

-- a)
select top(100) *  from FactStrategyPlan
select * from DimDate

select
	ScenarioDescription,
	sum(Amount) as 'valor total'
from 
	FactStrategyPlan
inner join DimScenario
	on FactStrategyPlan.ScenarioKey = DimScenario.ScenarioKey
group by ScenarioDescription
having ScenarioDescription <> 'Forecast'

-- b)
select
	CalendarYear,
	sum(Amount) as 'valor total'
from 
	FactStrategyPlan
inner join DimDate
	on FactStrategyPlan.Datekey = DimDate.Datekey
group by CalendarYear


-- 9
select 
	ProductSubcategoryName,
	count(*)
from
	DimProduct
inner join DimProductSubcategory
	on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
where BrandName = 'Contoso' and ColorName = 'Silver'
group by ProductSubcategoryName
	
--10
select *  from DimProduct
select * from DimProductSubcategory

select 
	ProductSubcategoryName,
	BrandName,
	count(*) as 'qtd de prod'
from
	DimProduct
inner join DimProductSubcategory
	on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
group by BrandName, ProductSubcategoryName
order by BrandName asc
	