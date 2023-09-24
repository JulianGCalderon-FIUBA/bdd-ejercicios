SELECT padron, COALESCE(nombre_inst_sec, 'SIN_INST')
FROM alumnos;