SELECT nombre, padron
FROM carreras LEFT OUTER JOIN inscripto_en 
	ON carreras.codigo = inscripto_en.codigo 
	AND padron > 75000;
