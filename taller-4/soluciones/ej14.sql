select padron, alumnos.nombre as alumno, materias.nombre as materia 
from notas 
	inner join alumnos using(padron) 
	inner join materias using(numero, codigo)
where nota = 10;