select carreras.nombre, count(inscripto_en)
from carreras left outer join inscripto_en using(codigo)
group by carreras.nombre
