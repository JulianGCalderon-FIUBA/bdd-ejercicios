select codigo, numero, count(notas)
from notas
group by codigo, numero
having count(notas) = (
	select max(cantidad) from (
		select count(notas) as cantidad
		from notas
		group by codigo, numero
	) as cantidad
)