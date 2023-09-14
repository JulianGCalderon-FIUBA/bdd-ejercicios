select padron, nombre 
from notas inner join alumnos using(padron)
where (codigo, numero) = (71, 14) and nota >= 4
	and padron not in (
		select padron from notas 
		where (codigo, numero) = (71, 15) and nota >= 4
	);