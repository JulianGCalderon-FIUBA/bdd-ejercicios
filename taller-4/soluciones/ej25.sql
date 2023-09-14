select avg(cantidad_de_notas) from (
	select padron, count(notas) as cantidad_de_notas from notas
	group by padron
) as cantidad_de_notas_por_alumno