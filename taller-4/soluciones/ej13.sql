select materias.nombre as materia, departamentos.nombre as departamento 
from materias inner join departamentos using(codigo);