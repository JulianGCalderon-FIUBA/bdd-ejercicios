SELECT DISTINCT padron
FROM notas INNER JOIN notas AS notas2
	USING(padron, codigo, numero)
WHERE (notas.codigo, notas.numero) = (75,15)
	AND notas != notas2;

SELECT DISTINCT padron FROM notas
WHERE (codigo, numero) = (75, 15)
GROUP BY padron
HAVING COUNT(*) > 1;


