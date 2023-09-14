select departamentos.nombre, departamentos.codigo, 
	count(distinct materias.numero) as materias,
	count(notas) as notas
from departamentos 
	inner join materias using(codigo)
	inner join notas using(codigo, numero)
group by departamentos.nombre, departamentos.codigo
order by materias desc;
