SELECT COUNT(DISTINCT padron) AS alumnos_calificados
FROM notas
WHERE nota IS NOT NULL;
