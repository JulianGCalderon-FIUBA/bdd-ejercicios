SELECT nombre, COUNT(padron)
FROM carreras LEFT OUTER JOIN inscripto_en USING(codigo)
GROUP BY codigo;
