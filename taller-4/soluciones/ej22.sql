select nombre, padron, avg(nota), max(nota)
from alumnos natural join notas
group by nombre, padron
having count(notas) > 3