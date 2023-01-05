-- Case para condi��es (formata��o):

select
	case
		when teste l�gico then resultado
		else resultado caso contr�rio
	end

-- exemplo aluno aprovado ou reprovado

declare @nota_aluno float
set @nota_aluno = 7

select 
	case
		when @nota_aluno >= 7 then 'Aluno Aprovado'
		else 'Aluno reprovado'
	end 

-- exemplo produto passou ou n�o da validade

declare @validade datetime
set @validade = '13/12/2022'

select 
	case
		when @validade < getdate() then 'Produto dentro da validade'
		else 'Produto fora da validade'
	end 

-- Exemplo no banco de dados contoso

select
	CustomerKey,
	FirstName,
	Gender,
	case
		when Gender = 'M' then 'Masculino'
		else 'Feminino'
	end as 'Genero'
from
	DimCustomer

-- Exemplos com mais de um teste L�gico

select
	CustomerKey,
	FirstName,
	Gender,
	case
		when Gender = 'M' then 'Masculino'
		when Gender = 'F' then 'Feminino'
		else 'N�o Bin�rio'
	end as 'Genero'
from
	DimCustomer

-- Exemplos com mais de um teste L�gico para aluno aprovado,reprovado e prova final
-- O Case vai sempre testar de cima para baixo, portando se o primeiro teste j� for atendido ele vai retornar o resultado j� da primeira condi��o

declare @nota_aluno float
set @nota_aluno = 8

select 
	case
		when @nota_aluno >= 7 then 'Aluno Aprovado'
		when @nota_aluno >= 6 then 'Prova Final'
		else 'Aluno reprovado'
	end as 'Situa��o Aluno'

-- Exemplos com or e and

select
	ProductName,
	BrandName,
	ColorName,
	UnitPrice,
	case
		when BrandName = 'Contoso' and ColorName = 'Red' then UnitPrice - (UnitPrice * 0.1)
		else UnitPrice
	end as 'Produto com Desconto'

from
	DimProduct

select
	ProductName,
	BrandName,
	ColorName,
	UnitPrice,
	case
		when BrandName = 'Litware' or BrandName = 'Fabrikam' then UnitPrice - (UnitPrice * 0.05)
		else UnitPrice
	end as 'Produto com Desconto'

from
	DimProduct

-- Alternativa ao CASE seria a fun��o IIF

select
	iif(
		teste l�gico,
		resultado se teste logico bater,
		resultado se teste logico n�o bater)

declare @classificacao int
set @classificacao = 4

select
	iif(
		@classificacao >= 5,
		'Alto Risco',
		'Baixo Risco') as 'Classifica��o'

select * from DimCustomer

select
	CustomerKey,
	CustomerType,
	iif(
		CustomerType = 'Person',
		FirstName,
		CompanyName) as 'Cliente'
from DimCustomer

-- Exemplo de iif composto

select * from DimProduct

select
	ProductKey,
	ProductName,
	StockTypeName,
	iif(StockTypeName = 'High', 'Jo�o',
		iif(StockTypeName = 'Mid','Maria','Luis')) as 'Responsavel'
from	
	DimProduct
		

select * from DimGeography

-- Fun��o ISNULL

select
	GeographyKey,
	ContinentName,
	-- CityName,
	isnull(CityName, 'Local Desconhecido') as 'Local'
from
	DimGeography
