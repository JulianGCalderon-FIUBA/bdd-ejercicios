(select padron from alumnos) except (select distinct padron from notas);
