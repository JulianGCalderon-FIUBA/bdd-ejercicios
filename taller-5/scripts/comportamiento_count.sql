SELECT inst_sec.nombre, COUNT(*)
FROM inst_sec 
	LEFT OUTER JOIN alumnos ON inst_sec.nombre = alumnos.nombre_inst_sec
GROUP BY inst_sec.nombre;

SELECT inst_sec.nombre, COUNT(padron)
FROM inst_sec 
	LEFT OUTER JOIN alumnos ON inst_sec.nombre = alumnos.nombre_inst_sec
GROUP BY inst_sec.nombre;

SELECT inst_sec.nombre, COUNT(padron)
FROM inst_sec 
	LEFT OUTER JOIN alumnos ON inst_sec.nombre = alumnos.nombre_inst_sec
WHERE padron >= 40000
GROUP BY inst_sec.nombre;

-- No funciona, pues si una institución tiene 
--  todos alumnos com padron desconocido o menos a 4000, entonces
--  la institución desaparece

SELECT inst_sec.nombre, COUNT(padron)
FROM inst_sec 
	LEFT OUTER JOIN alumnos ON inst_sec.nombre = alumnos.nombre_inst_sec
WHERE padron >= 40000 OR padron IS NULL
GROUP BY inst_sec.nombre;

-- No funciona, pues si una institución tiene 
--  todos alumnos com padron menor a 4000, entonces
--  la institución desaparece

SELECT inst_sec.nombre, COUNT(padron)
FROM inst_sec 
	LEFT OUTER JOIN alumnos ON 
		inst_sec.nombre = alumnos.nombre_inst_sec
		AND padron >= 40000
GROUP BY inst_sec.nombre;

-- Funciona
