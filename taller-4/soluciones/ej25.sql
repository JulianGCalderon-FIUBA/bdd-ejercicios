SELECT TRUNC(AVG(cantidad_notas), 2) AS promedio_cantidad_notas 
FROM (
	SELECT padron, COUNT(notas) AS cantidad_notas FROM notas
	GROUP BY padron
	) AS cantidad_notas;
