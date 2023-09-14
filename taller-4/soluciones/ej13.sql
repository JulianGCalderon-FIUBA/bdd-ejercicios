SELECT materias.nombre AS materia, departamentos.nombre AS departamento
FROM materias
	INNER JOIN departamentos USING(codigo);
