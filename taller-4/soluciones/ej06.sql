SELECT *
FROM alumnos
WHERE EXTRACT('YEAR' FROM fecha_ingreso) = 2010;

-- WHERE (fecha_ingreso, '2010-01-01') <=  ('2010-12-31', fecha_ingreso);
