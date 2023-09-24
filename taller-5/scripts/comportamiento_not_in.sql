SELECT * 
FROM inst_sec
WHERE NOT EXISTS (
	SELECT 1
	FROM alumnos
	WHERE alumnos.nombre_inst_sec = inst_sec.nombre
);

SELECT * 
FROM inst_sec
WHERE nombre NOT IN (
	SELECT nombre_inst_sec
	FROM alumnos
);

-- No funciona, pues la subconsulta devuelve un NULL, por
--  lo que el resultado del NOT IN es "desconocido", lo cual
--  se evalua a FALSE.

SELECT * 
FROM inst_sec
WHERE nombre NOT IN (
	SELECT nombre_inst_sec
	FROM alumnos
	WHERE nombre_inst_sec IS NOT NULL
);