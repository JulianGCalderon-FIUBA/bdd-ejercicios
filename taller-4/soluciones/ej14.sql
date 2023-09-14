SELECT padron, alumnos.nombre AS alumno, materias.nombre AS materia
FROM notas
	JOIN alumnos USING(padron)
	JOIN materias USING(numero, codigo)
WHERE nota = 10;
