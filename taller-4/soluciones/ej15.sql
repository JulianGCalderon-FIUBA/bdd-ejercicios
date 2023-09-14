select carreras.nombre, inscripto_en.padron
from inscripto_en
	right outer join carreras using(codigo)
	