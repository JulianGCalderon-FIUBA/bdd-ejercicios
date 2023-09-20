SELECT codigo, numero, COUNT(notas) AS notas
FROM notas
GROUP BY codigo, numero
HAVING COUNT(notas) = (
	SELECT MAX(cantidad_notas) FROM (
		SELECT COUNT(notas) AS cantidad_notas
		FROM notas
		GROUP BY codigo, numero
	) AS cantidad_max
);

SELECT codigo, numero, COUNT(notas) AS notas
FROM notas
GROUP BY codigo, numero
HAVING COUNT(notas) >= ALL (
	SELECT COUNT(notas)
	FROM notas
	GROUP BY codigo, numero
);
