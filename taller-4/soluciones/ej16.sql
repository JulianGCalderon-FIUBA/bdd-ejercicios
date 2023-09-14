select carreras.nombre, inscripto_en.padron
from (select * from inscripto_en where padron > 75000) as inscripto_en
	right outer join carreras using(codigo)

	