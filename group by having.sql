select BrandName, count(*) from DimProduct
group by BrandName

select StoreType, sum(EmployeeCount) as 'Total de Func.' from DimStore
group by StoreType

select BrandName, avg(UnitPrice) as 'Média de custo' from DimProduct
group by BrandName

select ClassName, max(UnitPrice) as 'Maximo valor' from DimProduct
group by ClassName

-- Colocar group by em ordem crescente e decrescente
select StoreType, sum(EmployeeCount) as 'Total de Func.' from DimStore
group by StoreType
order by 'Total de Func.' desc

-- Group by combinado com where
select top(5) ColorName, count(*) as 'qtd' from DimProduct
where BrandName = 'Contoso'
group by ColorName
order by qtd desc

-- HAVING: usado para fazer filtros depois do agrupamento
select ColorName, count(*) as 'qtd' from DimProduct
group by ColorName
having count(*) >= 100
order by qtd desc



select * from DimProduct
select * from DimStore