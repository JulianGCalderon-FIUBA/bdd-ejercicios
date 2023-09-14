select padron
from notas
group by padron
having count(distinct concat(codigo, numero)) = (
	select count(materias) as cantidad from materias
);