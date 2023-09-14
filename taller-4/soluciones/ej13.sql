SELECT materias.nombre AS materia, departamentos.nombre AS departamento
FROM materias 
	JOIN departamentos USING(codigo);
