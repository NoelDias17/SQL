-- Manipulando textos e datas

-- verificar tamanho do texto em quest�o (sem contar espa�os)
select
	len('texto ') as 'Len',

-- verificar tamanho do texto em quest�o (contando espa�os)

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

--  Trocando textos por outros textos com a fun��o Replace

select
	replace('Testando a fun��o replace', 'Testando', 'Avaliando')

-- Replace Dentro de Replace para quando for trocar mais de um texto da mesma coluna
select 
	FirstName,
	LastName,
	replace(replace(Gender, 'M', 'Masculino'), 'F', 'Feminino')
	-- replace(replace(Gender,'F', 'Feminino' ), 'M', 'Masculino') -- aten��o para a ordem da substitui��o para n�o conflitar
from
	DimCustomer

-- Fun��o translate serve para trocar caracteres especificos de dentro de um texto por outros caracteres

select TRANSLATE('kcx-8097', '-',' ') -- trocou o '-' por espa�o

-- Fun��o stuff serve para substituir qualquer texto pela numera��o dos caracteres , n�o sendo necess�rio especificar o texto

select stuff('vba impressionador', 1, 3, 'excel')

-- para colocar os textos em maiusculo ou minusculo use upper e lower

select 
	FirstName,
	UPPER(FirstName) as	'Maiusculo',
	LOWER(FirstName) as 'Minusculo'
from
	DimCustomer

-- Fun��o Format

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

	-- formata��o personalizada
select format(14266451717, '###-###-###-##')

-- para localizar a posi��o de um caractere/palavra em um texto use a fun��o Charindex
select charindex('e','noel dias')
select charindex('dias','noel dias')

-- para extrair alguns caracteres de dentro de um texto use a fun��o substring
select substring('Noel Dias', 6,3) -- O 1 n� diz a partir de qual caractere vai come�ar a extrair/ o segundo diz quantos caracteres ser�o extraidos

-- combinando Charindex e substring para extrair automaticamente sobrenomes por exemplo
select charindex(' ','Noel Dias') -- localizar o index do espa�o 
select substring('Noel Dias', charindex(' ','Noel Dias') + 1 , 100) -- o + 1 � para pegar a partir do caractere ap�s o espa�o/ o 100 � para ter certeza que pegara todos os sobrenomes possiveis pois nunca haver� um sobrenome com mais de 100 caracteres

	-- Fazendo a mesma combina��o s� que com uso de variavel
declare @varNome VARCHAR(100)
set @varnome = charindex(' ','Noel Dias')
select substring('Noel Dias', @varnome + 1 , 100) 


-- Para retirar espa�os dos dois lados use TRIM, espa�os a esquerda use LTRIM e espa�os a direita use RTRIM

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

-- SELECT DATEFROMPARTS (@varDia,@varMes,@varAno) essa ordem brasileira n�o funciona

SELECT DATEFROMPARTS (@varAno,@varMes,@varDia) -- utilizar essa formata��o americana e qualquer coisa mudar para a brasileira depois como abaixo:

SELECT format(DATEFROMPARTS (@varAno,@varMes,@varDia), 'dd/MM/yyyy')

-- Para pegar data e hora atuais do sistema use a fun��o getdate()

select getdate()
select sysdatetime()

-- Para pegar nome das datas (no caso do exemplo abaixo � data de hoje dentro da variavel)

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
	dateadd(day, 10, @data1) -- primeiro o que ser� somado(dia, mes anos) , segundo a quantidade (10 dias no caso), e terceiro a variavel

select
	dateadd(day, -1, @data1) -- primeiro o que ser� somado(dia, mes anos) , segundo a quantidade (10 dias no caso), e terceiro a variavel

-- Para adicionar ou subtrair quantidade de dias de uma data use DATEDIFF

select
	datediff(year, @data1, @data2)