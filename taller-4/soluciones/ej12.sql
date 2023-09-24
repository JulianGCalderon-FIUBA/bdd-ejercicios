SELECT nombre
FROM departamentos
UNION (
	SELECT nombre
	FROM materias);
