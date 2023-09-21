SELECT padron, codigo, numero, nota
FROM Alumnos INNER JOIN Notas USING(padron)
WHERE fecha_ingreso = (
	SELECT MIN(fecha_ingreso)
	FROM Alumnos
);