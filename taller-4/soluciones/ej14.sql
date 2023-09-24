SELECT padron, alumnos.nombre AS alumno, materias.nombre AS materia
FROM notas
	INNER JOIN alumnos USING(padron)
	INNER JOIN materias USING(numero, codigo)
WHERE nota = 10;
