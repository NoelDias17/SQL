-- Exercicios Strings e Datas

--1 a) 
select 
	ProductName,
	len(ProductName) as 'Nome Produto Tamanho'
from 
	DimProduct 
order by len(ProductName) desc

-- b)
select avg(len(ProductName)) as 'Média tamanho caracteres' from DimProduct

-- c)
select replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(ProductName, 'The Phone Company ',''),'Contoso ',''),'WWI ',''),'Adventure Works ' ,''),'Litware ' ,''),'Fabrikam ' ,''),'Proseware ' ,''),'A. Datum ' ,''),' Red' ,''),' Black' ,''),' Green' ,''),' White' ,''),' Blue' ,''),' Silver' ,''),' Yellow' ,''),' Orange' ,''),' Pink' ,''),' Purple' ,''),' Brown' ,''),' Gold' ,''),' Grey' ,'')
from DimProduct

-- Jeito mais compacto pegando todos os nomes de marcas e cores das resppectivas colunas
select replace(replace(ProductName, BrandName,''),ColorName,'')
from DimProduct

-- d)
select avg(len(replace(replace(ProductName, BrandName,''),ColorName,''))) as 'Média tamanho caracteres' from DimProduct

--2
select 
	ProductName,
	translate(translate(translate(translate(translate(translate(translate(translate(translate(translate(StyleName, '0','A'),'1','B'),'2','C'),'3','D'),'4','E'),'5','F'),'6','G'),'7','H'),'8','I'),'9','J')
from 
	DimProduct

-- Jeito mais compacto sem tantos translates
select 
	ProductName,
	translate(StyleName, '0123456789', 'ABCDEFGHIJ') -- importante q a sequencia de caracteres antigos esteja igual a sequencia de caracteres novos , ex: 0 e A são os primeiros de cada lista
from 
	DimProduct

--3

select * from DimEmployee
select charindex('@',EmailAddress) from DimEmployee

select 
	concat(FirstName, ' ',LastName) as 'Nome Completo',
	EmailAddress as 'Email',
	substring(EmailAddress, charindex('@',EmailAddress) - charindex('@',EmailAddress), charindex('@',EmailAddress)) as 'Login',
	concat(upper(FirstName),right(BirthDate, 2)) as 'Senha'
from DimEmployee

-- Outro jeito
select 
	concat(FirstName, ' ',LastName) as 'Nome Completo',
	EmailAddress as 'Email',
	left(EmailAddress, charindex('@',EmailAddress) - 1) as 'Login',
	upper(FirstName) + right(BirthDate, 2) as 'Senha'
from DimEmployee

-- 4
select 
	FirstName,
	EmailAddress,
	AddressLine1,
	datename(year, DateFirstPurchase) as 'Data Primeira Compra'
from 
	DimCustomer
where datename(year, DateFirstPurchase) = 2001

-- Outro Jeito
select 
	FirstName,
	EmailAddress,
	AddressLine1,
	DateFirstPurchase
from 
	DimCustomer
where year(DateFirstPurchase) = 2001

-- 5
select 
	FirstName,
	EmailAddress,
	HireDate,
	datename(day, HireDate) as 'Dia',
	datename(month, HireDate) as 'Mês',
	datename(year, HireDate) as 'Ano'
from
	DimEmployee

-- Outro Jeito
select 
	FirstName,
	EmailAddress,
	HireDate,
	day(HireDate) as 'Dia',
	datename(month, HireDate) as 'Mês',
	year(HireDate) as 'Ano'
from
	DimEmployee

-- 6
select
	StoreName,
	datediff(day, OpenDate, getdate()) as 'qtd dias aberta',
	CloseDate
from 
	DimStore
where CloseDate = NULL
order by 'qtd dias aberta' desc


select
	*
from 
	DimStore