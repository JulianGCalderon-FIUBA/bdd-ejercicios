SELECT COUNT(*), 
	SUM(cantidad_creditos), 
	AVG(cantidad_creditos)
FROM alumnos;

SELECT COUNT(*), 
	SUM(cantidad_creditos), 
	AVG(cantidad_creditos)
FROM alumnos
WHERE cantidad_creditos IS NOT NULL;

SELECT COUNT(*),
	SUM(cantidad_creditos),
	CAST(SUM(cantidad_creditos) AS FLOAT)/COUNT(*) as avg
FROM alumnos;

SELECT COUNT(*), 
	SUM(cantidad_creditos), 
	AVG(COALESCE(cantidad_creditos, 0))
FROM alumnos;
