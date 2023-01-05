select top (100) * from DimStore
order by EmployeeCount Desc -- ordenar de forma descendente
-- order by EmployeeCount asc (para ordenar de forma ascendente)

select top (10)  
	ProductName, 
	UnitCost,
	Weight
from 
	DimProduct
order by 
	UnitCost desc, Weight desc

-- Nesse caso o weight é uma coluna e não a função

