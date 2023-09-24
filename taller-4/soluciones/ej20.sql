SELECT departamentos.nombre as departamento,
	codigo,
	COUNT(DISTINCT numero) AS materias,
	COUNT(notas) AS notas
FROM departamentos
	INNER JOIN materias USING(codigo)
	INNER JOIN notas USING(codigo, numero)
GROUP BY departamentos.nombre, codigo
ORDER BY materias DESC;
