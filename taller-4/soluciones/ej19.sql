select distinct notas.padron as padron1, notas2.padron as padron2, fecha, codigo, numero
from notas inner join notas as notas2 using(codigo, numero, fecha)
where notas.padron < notas2.padron;

