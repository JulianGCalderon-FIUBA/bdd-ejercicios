SELECT padron, apellido
FROM Alumnos INNER JOIN Notas USING(padron)
WHERE nota >= 4
GROUP BY padron, apellido
HAVING COUNT(*) >= ALL (
	SELECT COUNT(DISTINCT (codigo, numero))
	FROM Alumnos INNER JOIN Notas USING(padron)
	WHERE nota >= 4
	GROUP BY padron, apellido
);
