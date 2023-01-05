-- 1

-- a 
select channelKey, sum(SalesQuantity) from factsales
group by channelKey

-- b
select StoreKey, sum(SalesQuantity) as 'qtd vendida', sum(ReturnQuantity) as 'qtd retornada' from factsales
group by StoreKey

-- c
select channelKey, sum(SalesAmount) as 'total de vendas' from factsales
-- como na coluna datakey tinha info de data e hora nao precisou colocar o '-' entre os meses,dias e anos
where DateKey between '20070101' and '20071231'
group by channelKey

-- 2

-- a
select ProductKey, sum(SalesAmount) as 'total de vendas' from factsales
group by ProductKey
having sum(SalesAmount) >= 5000000
order by sum(SalesAmount) desc

-- b
select top(10) ProductKey, sum(SalesAmount) as 'total de vendas' from factsales
group by ProductKey
-- having sum(SalesAmount) > 5000000
order by sum(SalesAmount) desc

-- 3

-- a
select top(1) CustomerKey, sum(SalesQuantity) as 'qtd vendida' from FactOnlineSales
group by CustomerKey
order by sum(SalesQuantity) desc

-- b
select top(3) ProductKey, sum(SalesQuantity) as 'qtd vendida' from FactOnlineSales
where CustomerKey = 19037
group by ProductKey
order by sum(SalesQuantity) desc

select top(3) ProductKey, sum(SalesQuantity) as 'qtd vendida' from FactOnlineSales
group by ProductKey
order by sum(SalesQuantity) desc

-- 4

-- a
select BrandName, count(ProductKey) as 'qtd de produtos' from DimProduct
group by BrandName

-- b
select ClassName, avg(UnitPrice) as 'média de preço' from DimProduct
group by ClassName

-- c
select ColorName, sum(Weight) as 'peso total' from DimProduct
group by ColorName
order by sum(Weight) desc

-- 5

select StockTypeName, sum(Weight) as 'peso total' from DimProduct
where BrandName = 'Contoso'
group by StockTypeName
order by sum(Weight) desc

-- 6 

select BrandName, count(distinct ColorName) as 'qtd de cores' from DimProduct
group by BrandName
order by count(distinct ColorName) desc

-- 7 

select Gender as 'qtd clientes', count(Gender), avg(YearlyIncome) from DimCustomer
where Gender is not null
group by Gender 

-- 8

select Education as 'grau de educação', avg(YearlyIncome) as ' media salarial', count(*) as 'qtd de clientes' from DimCustomer
where Education is not null
group by Education

-- 9 

select DepartmentName, count(EmployeeKey) as 'qtd func' from DimEmployee
where EndDate is null
group by DepartmentName
order by count(EmployeeKey) desc

-- 10
select Title, sum(VacationHours) as 'horas de vacation' from DimEmployee
where gender = 'F' and DepartmentName in ('Production', 'Marketing', 'Engineering', 'Finance') and HireDate between '1999-01-01' and '2000-12-31'
group by Title


select * from DimEmployee