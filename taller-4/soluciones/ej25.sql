SELECT AVG(cantidad_notas) AS promedio_cantidad_notas 
FROM (
	SELECT padron, COUNT(notas) AS cantidad_notas 
	FROM notas
	GROUP BY padron
) AS cantidad_notas;

SELECT CAST(COUNT(*) AS FLOAT) / COUNT(DISTINCT padron) AS promedio_cantidad_notas
FROM Notas;
