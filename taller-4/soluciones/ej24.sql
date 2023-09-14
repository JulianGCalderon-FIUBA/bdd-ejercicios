SELECT padron
FROM notas
GROUP BY padron
HAVING COUNT(DISTINCT (codigo, numero)) = (
	SELECT COUNT(*) FROM materias);
