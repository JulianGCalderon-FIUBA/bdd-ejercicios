WITH Aprobadas71000(codigo, numero) AS (
	SELECT DISTINCT codigo, numero
	FROM Notas
	WHERE padron = 71000 AND nota >= 4
)
SELECT padron
FROM Alumnos
WHERE NOT EXISTS (
	SELECT *
	FROM Aprobadas71000
	WHERE NOT EXISTS (
		SELECT 1
		FROM Notas
		WHERE Notas.padron = Alumnos.padron
			AND Notas.codigo = Aprobadas71000.codigo
			AND Notas.numero = Aprobadas71000.numero
	)
);