SELECT padron, codigo, numero,  fecha, nota * 10 AS nota
FROM notas
ORDER BY padron LIMIT 5 OFFSET 5;

-- ORDER BY padron offset 5 rows fetch next 5 rows only;
