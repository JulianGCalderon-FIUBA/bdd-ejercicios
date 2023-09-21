SELECT padron
FROM alumnos
WHERE nombre_inst_sec = 'ILSE';

SELECT padron
FROM alumnos
WHERE nombre_inst_sec != 'ILSE'
	OR nombre_inst_sec IS NULL;