-- exercicios modulo 2

-- 1) letra A: numero de produtos se manteve
SELECT * from DimProduct

-- 1) letra B: numero reduziu
select distinct CustomerKey from DimCustomer

-- 2) letra A:
select CustomerKey, FirstName, EmailAddress, BirthDate from DimCustomer

-- 2) letra B:
select 
	CustomerKey as 'Chave cliente', 
	FirstName as 'Nome cliente', 
	EmailAddress as 'Email cliente', 
	BirthDate as 'Aniversário cliente'
from DimCustomer

-- 3) letra A:
select top(100)
	*
from 
	DimCustomer

-- 3) letra B:
select top(20) percent
	*
from 
	DimCustomer

-- 3) letra C e D:
select top(100)
	FirstName as 'Primeiro Nome', 
	EmailAddress as 'Email', 
	BirthDate as 'Data de nascimento' 
from 
	DimCustomer

-- 4)
select distinct
	Manufacturer as 'Fornecedores Contoso'
from
	DimProduct

-- 5) Teve apenas um produto que ainda não foi vendido
select /*distinct
	ProductName*/
	*
from
	DimProduct

select Distinct
	ProductKey
from
	FactSales


