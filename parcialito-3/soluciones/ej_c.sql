SELECT Inscripto_En.codigo as carrera,
	Notas.codigo as departamento,
	AVG(nota)
FROM Notas INNER JOIN Inscripto_En USING(padron)
GROUP BY Inscripto_En.codigo, Notas.codigo
