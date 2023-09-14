SELECT padron 
FROM alumnos
EXCEPT (
	SELECT DISTINCT padron 
	FROM notas
	WHERE nota IS NOT NULL);
