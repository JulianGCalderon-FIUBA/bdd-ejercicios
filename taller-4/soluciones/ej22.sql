SELECT nombre, padron, TRUNC(AVG(nota), 2) as promedio, MAX(nota) as maxima
FROM alumnos INNER JOIN notas USING(padron)
GROUP BY nombre, padron
HAVING COUNT(notas) > 3;
