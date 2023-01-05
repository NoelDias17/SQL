-- 1 

select 
	ProductKey,
	ProductName,
	DimProductSubcategory.ProductSubcategoryName,
	DimProductSubcategory.ProductSubcategoryKey
from
	DimProduct

inner join DimProductSubcategory
	on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
	
-- 2

select 
	DimProductSubcategory.ProductCategoryKey,
	DimProductSubcategory.ProductSubcategoryName,
	DimProductSubcategory.ProductSubcategoryDescription,
	ProductCategoryDescription
from
	DimProductSubcategory

left join DimProductCategory
	on DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey

-- 3 

select
	StoreKey,
	-- DimStore.GeographyKey,
	StoreName,
	EmployeeCount,
	ContinentName,
	RegionCountryName
from
	DimStore
left join DimGeography
	on DimStore.GeographyKey = DimGeography.GeographyKey

-- 4 

select
	ProductKey,
	ProductName,
	-- DimProduct.ProductSubcategoryKey,
	ProductDescription,
	DimProductSubcategory.ProductCategoryKey,
	ProductCategoryDescription
from
	DimProduct
inner join DimProductSubcategory
	on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
	inner join DimProductCategory
		on DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey

select * from DimProduct
select * from DimProductSubcategory
select * from DimProductCategory

-- 5

select 
	StrategyPlanKey,
	DateKey,
	-- FactStrategyPlan.AccountKey,
	AccountName,
	Amount
from 
	FactStrategyPlan
inner join DimAccount
	on FactStrategyPlan.AccountKey = DimAccount.AccountKey

select top (100) * from FactStrategyPlan

-- 6

select 
	StrategyPlanKey,
	DateKey,
	-- FactStrategyPlan.AccountKey,
	ScenarioName,
	Amount
from 
	FactStrategyPlan
inner join DimScenario
	on FactStrategyPlan.ScenarioKey = DimScenario.ScenarioKey

-- 7

select
	ProductName,
	DimProduct.ProductSubcategoryKey,
	ProductSubcategoryName
from
	DimProduct
right join DimProductSubcategory
	on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
where ProductName is null

select * from DimProduct
select * from DimProductSubcategory

-- 8
select 
	distinct BrandName,
	ChannelName
from 
	DimChannel cross join DimProduct
where BrandName in ('Contoso','Fabrikam','Litware')

-- 9
select top(1000)
	OnlineSalesKey,
	DateKey,
	PromotionName,
	SalesAmount
from
	FactOnlineSales
inner join DimPromotion
	on FactOnlineSales.PromotionKey = DimPromotion.PromotionKey
where PromotionName <> 'No Discount'
order by DateKey asc


select top (100) * from FactOnlineSales
select * from DimPromotion

-- 10
select top (100)
	SalesKey,
	ChannelName,
	StoreName,
	ProductName,
	SalesAmount
from
	FactSales
inner join DimChannel
	on FactSales.channelKey = DimChannel.channelKey
	inner join DimStore
		on FactSales.StoreKey = DimStore.StoreKey
		inner join DimProduct
			on FactSales.ProductKey = DimProduct.ProductKey
order by SalesAmount desc

select top (100) * from FactSales
select * from DimChannel
select * from DimStore
select * from DimProduct