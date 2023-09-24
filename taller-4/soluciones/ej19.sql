SELECT notas.padron AS padron1, notas2.padron AS padron2, fecha, codigo, numero
FROM notas INNER JOIN notas AS notas2 USING(codigo, numero, fecha)
WHERE notas.padron < notas2.padron;
