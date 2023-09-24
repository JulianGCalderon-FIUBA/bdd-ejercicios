SELECT nombre, padron
FROM carreras LEFT OUTER JOIN inscripto_en
	USING(codigo);
