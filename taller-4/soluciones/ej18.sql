SELECT padron, nombre
FROM notas INNER JOIN alumnos USING(padron)
WHERE (codigo, numero) = (71, 14) AND nota >= 4
	AND padron NOT IN (
		SELECT padron FROM notas
		WHERE (codigo, numero) = (71, 15) AND nota >= 4
	);
