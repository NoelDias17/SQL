-- Manipulando textos e datas

-- verificar tamanho do texto em questão (sem contar espaços)
select
	len('texto ') as 'Len',

-- verificar tamanho do texto em questão (contando espaços)

	datalength('texto   ') as 'Data Length'

-- concatenar/juntar textos em tabelas
select 
	FirstName,
	LastName,
	concat(FirstName,' ',LastName)
from
	DimCustomer

-- pegar somente partes de um texto com base no numero de caracteres da esquerda para direita ou da direita para esquerda
select 
	left('Produto12345',7) as 'esquerda para direita', -- pega os 7 primeiros caracteres
	right('Produto12345',5) as 'direita para esquerda' -- pega os 5 ultimos caracteres


-- concatenando e usando right e left ao mesmo tempo
select
	ProductName,
	UnitPrice,
	concat(left(StyleName, 7), ' ', right(StyleName, 7))
	
from 
	DimProduct

--  Trocando textos por outros textos com a função Replace

select
	replace('Testando a função replace', 'Testando', 'Avaliando')

-- Replace Dentro de Replace para quando for trocar mais de um texto da mesma coluna
select 
	FirstName,
	LastName,
	replace(replace(Gender, 'M', 'Masculino'), 'F', 'Feminino')
	-- replace(replace(Gender,'F', 'Feminino' ), 'M', 'Masculino') -- atenção para a ordem da substituição para não conflitar
from
	DimCustomer

-- Função translate serve para trocar caracteres especificos de dentro de um texto por outros caracteres

select TRANSLATE('kcx-8097', '-',' ') -- trocou o '-' por espaço

-- Função stuff serve para substituir qualquer texto pela numeração dos caracteres , não sendo necessário especificar o texto

select stuff('vba impressionador', 1, 3, 'excel')

-- para colocar os textos em maiusculo ou minusculo use upper e lower

select 
	FirstName,
	UPPER(FirstName) as	'Maiusculo',
	LOWER(FirstName) as 'Minusculo'
from
	DimCustomer

-- Função Format

	-- Geral
select format(1000, 'G')

	-- Numero
select format(1000, 'N')

	-- Moeda / Currency
select format(1000, 'C')

	-- dd/MMMM/yyyy
select format(cast('23/04/2020' as datetime), 'dd/MMMM/yyyy', 'en-US')

	-- dia
select format(cast('23/04/2020' as datetime), 'dddd')

	-- mes
select format(cast('23/04/2020' as datetime), 'MMMM')

	-- ano
select format(cast('23/04/2020' as datetime), 'yyyy')

	-- formatação personalizada
select format(14266451717, '###-###-###-##')

-- para localizar a posição de um caractere/palavra em um texto use a função Charindex
select charindex('e','noel dias')
select charindex('dias','noel dias')

-- para extrair alguns caracteres de dentro de um texto use a função substring
select substring('Noel Dias', 6,3) -- O 1 n° diz a partir de qual caractere vai começar a extrair/ o segundo diz quantos caracteres serão extraidos

-- combinando Charindex e substring para extrair automaticamente sobrenomes por exemplo
select charindex(' ','Noel Dias') -- localizar o index do espaço 
select substring('Noel Dias', charindex(' ','Noel Dias') + 1 , 100) -- o + 1 é para pegar a partir do caractere após o espaço/ o 100 é para ter certeza que pegara todos os sobrenomes possiveis pois nunca haverá um sobrenome com mais de 100 caracteres

	-- Fazendo a mesma combinação só que com uso de variavel
declare @varNome VARCHAR(100)
set @varnome = charindex(' ','Noel Dias')
select substring('Noel Dias', @varnome + 1 , 100) 


-- Para retirar espaços dos dois lados use TRIM, espaços a esquerda use LTRIM e espaços a direita use RTRIM

declare @vartexto VARCHAR(100)
set @vartexto = '   ABC123       '

select trim(@vartexto)) as 'TRIM'
select ltrim(@vartexto)) as 'LTRIM'
select rtrim(@vartexto)) as 'RTRIM'

select datalength(trim(@vartexto)) as 'TRIM'
select datalength(ltrim(@vartexto)) as 'LTRIM'
select datalength(rtrim(@vartexto)) as 'RTRIM'

-- Para identificar o dia, mes e ano de uma data

declare @vardata datetime
set @vardata = '17/01/1997'

select 
	day(@vardata),
	month(@vardata),
	year(@vardata)

-- Para juntar numeros/partes (int) e formar uma data use DATEFROMPARTS

DECLARE @varDia INT, @varMes INT, @varAno INT
SET @varDia = 29
SET @varMes = 04
SET @varAno = 1984

-- SELECT DATEFROMPARTS (@varDia,@varMes,@varAno) essa ordem brasileira não funciona

SELECT DATEFROMPARTS (@varAno,@varMes,@varDia) -- utilizar essa formatação americana e qualquer coisa mudar para a brasileira depois como abaixo:

SELECT format(DATEFROMPARTS (@varAno,@varMes,@varDia), 'dd/MM/yyyy')

-- Para pegar data e hora atuais do sistema use a função getdate()

select getdate()
select sysdatetime()

-- Para pegar nome das datas (no caso do exemplo abaixo é data de hoje dentro da variavel)

declare @datadehoje datetime
set @datadehoje = getdate()

select -- datename retorna o resultado em forma de texto
	datename(day, @datadehoje),
	datename(MONTH, @datadehoje),
	datename(year, @datadehoje),
	datename(dayofyear, @datadehoje) -- Para pegar o numero do dia no ano (365 dias)

select -- datepart retorna o resultado em forma de numero
	datepart(day, @datadehoje),
	datepart(MONTH, @datadehoje),
	datepart(year, @datadehoje),
	datepart(dayofyear, @datadehoje) -- Para pegar o numero do dia no ano (365 dias)

-- Para adicionar ou subtrair quantidade de dias de uma data use DATEADD

declare @data1 datetime
set @data1 = '10/07/1990'

declare @data2 datetime
set @data2 = '10/07/1940'

declare @data3 datetime
set @data3 = '10/07/1970'

select
	dateadd(day, 10, @data1) -- primeiro o que será somado(dia, mes anos) , segundo a quantidade (10 dias no caso), e terceiro a variavel

select
	dateadd(day, -1, @data1) -- primeiro o que será somado(dia, mes anos) , segundo a quantidade (10 dias no caso), e terceiro a variavel

-- Para adicionar ou subtrair quantidade de dias de uma data use DATEDIFF

select
	datediff(year, @data1, @data2)