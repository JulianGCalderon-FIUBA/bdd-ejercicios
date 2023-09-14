SELECT padron
FROM alumnos
WHERE NOT EXISTS (
	SELECT 1
	FROM materias
	WHERE NOT EXISTS (
		SELECT 1
		FROM notas
		WHERE notas.padron = alumnos.padron
			AND notas.numero = materias.numero
			AND notas.codigo = materias.codigo
	)
);

SELECT padron
FROM alumnos
WHERE NOT EXISTS (
	SELECT codigo, numero
	FROM materias
	EXCEPT (
		SELECT DISTINCT codigo, numero
		FROM notas
		WHERE notas.padron = alumnos.padron
	)
);


SELECT padron
FROM notas
GROUP BY padron
HAVING COUNT(DISTINCT (codigo, numero)) = (
	SELECT COUNT(*) FROM materias
);

