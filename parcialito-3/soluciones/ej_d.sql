SELECT padron, apellido, AVG(nota) as promedio
FROM Alumnos INNER JOIN Notas USING(padron)
GROUP BY padron
HAVING COUNT(DISTINCT (codigo, numero)) > 3
	AND AVG(nota) >= 5
