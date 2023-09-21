SELECT DISTINCT padron, apellido
FROM Alumnos INNER JOIN Notas USING(padron)
WHERE (codigo, numero) = (71,14)
	OR (codigo, numero) = (71,15)
EXCEPT (
	SELECT DISTINCT padron, apellido
	FROM Alumnos INNER JOIN Notas USING(padron)
	WHERE (codigo, numero) = (75,01)
		OR (codigo, numero) = (75,15)
);
