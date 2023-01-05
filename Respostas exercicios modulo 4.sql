-- 1
select top(100) * from FactSales order by SalesAmount desc

-- 2
select top(10) * from DimProduct order by UnitPrice desc, Weight desc, AvailableForSaleDate asc

-- 3
select ProductName as 'Nome do produto', Weight as 'Peso' from DimProduct 
where Weight >= 100
order by Peso desc

-- 4
select StoreName as 'nome da loja', OpenDate as 'data de abertura', EmployeeCount as 'num de funcionarios' from DimStore
-- c
select StoreName as 'nome da loja', OpenDate as 'data de abertura', EmployeeCount as 'num de funcionarios', StoreType, Status  from DimStore
where StoreType = 'Store' and Status = 'On'

-- 5
select * from DimProduct
where ProductName like '%Home Theater%' and BrandName = 'Litware' and AvailableForSaleDate = '20090315'
-- Retirar os traços da data pois a coluna de data em questao possui hora, minutos e segundos também e isso dificulta o filtro

-- 6
select * from DimStore
-- a)
where Status = 'off'
-- b)
select * from DimStore
where CloseDate is not null

-- 7
select * from DimStore
where EmployeeCount <= '20'

select * from DimStore
-- where EmployeeCount >= '21' and EmployeeCount <= '50' 
where EmployeeCount between '21' and '50' 

select * from DimStore
where EmployeeCount >= '51'

-- 8
select ProductKey, ProductName, UnitPrice from DimProduct
where ProductDescription like '%LCD%'

-- 9 
select * from DimProduct
where ColorName in ('Green', 'Orange', 'Black', 'Silver', 'Pink') and BrandName in ('Contoso', 'Litware', 'Fabrikam')

-- 10
select * from DimProduct
where BrandName = 'Contoso' and ColorName = 'Silver' and UnitPrice between 10 and 30
order by UnitPrice Desc


