select padron, codigo, numero,  fecha, nota*10 as nota
from notas
order by padron limit 5 offset 5;

-- order by padron offset 5 rows fetch next 5 rows only;