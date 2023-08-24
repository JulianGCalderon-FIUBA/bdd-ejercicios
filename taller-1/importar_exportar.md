
## Importar

Para realizar un dump de la base de datos, primero debemos crear la base de datos en la cual cargar la información:

```bash
createdb -U admin -T template0 schooldb
```

Utilizamos `template0` ya que `template1` puede tener información personal que no queremos en nuestra base de datos.

Luego, realizamos el dump:

```bash
pg_dump -U admin -d schooldb < schooldb.sql
```

Si queremos exportar en archivo no de texto plano, podemos utilizar `-F` para indicar un formato particular:

```bash
pg_dump -U admin -d schooldb -F c > schooldb.dump
```


## Exportar

Para exportar, basta con realizar un dump de la base de datos:

```bash
psql -U admin -d schooldb > schooldb.sql
```

Para exportar de un formato no de texto plano, entonces utilizamos pg_restore:

```bash
pg_restore -U admin -d schooldb schooldb.dump
```
