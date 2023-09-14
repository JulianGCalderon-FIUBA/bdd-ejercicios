select distinct padron 
from notas inner join notas as notas2 using(padron, codigo, numero)
where notas.fecha != notas2.fecha;

/*
select padron from notas
where notas.codigo = 75 and notas.numero = 15 
group by padron
having count(padron) > 1;
*/