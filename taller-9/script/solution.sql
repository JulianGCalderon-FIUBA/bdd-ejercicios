SELECT * FROM books WHERE author = 'Bruce Norman';
EXPLAIN SELECT * FROM books WHERE author = 'Bruce Norman';
-- Tiene indice secundario para el autor

SELECT * FROM books WHERE title = 'The Perfect Fool';
EXPLAIN SELECT * FROM books WHERE title = 'The Perfect Fool';
-- No tiene indice para el titulo

CREATE INDEX IF NOT EXISTS idx_book_title ON Books(title);

SELECT * FROM books WHERE title = 'The Perfect Fool';
EXPLAIN SELECT * FROM books WHERE title = 'The Perfect Fool';
-- Ahora si tiene indice secundario para el titulo

SELECT * FROM books WHERE author LIKE 'John %';
EXPLAIN SELECT * FROM books WHERE author LIKE 'John %';
-- No tiene indice ordenado por patrones para el autor

DROP INDEX IF EXISTS idx_book_author;
CREATE INDEX idx_book_author ON books(author varchar_pattern_ops);

SELECT * FROM books WHERE author LIKE 'John %';
EXPLAIN SELECT * FROM books WHERE author LIKE 'John %';
-- Ahora si tiene indice secundario ordenado por patrones para el autor

SELECT * FROM books WHERE author ILIKE 'ROBERT COWLEY';
EXPLAIN SELECT * FROM books WHERE author ILIKE 'ROBERT COWLEY';
-- No se puede usar un indice ordenado por patrones para consultas ILIKE

CREATE INDEX IF NOT EXISTS ids_book_author_ic on books(lower(author));
-- Creamos un indice para los autores en minuscula

SELECT * FROM books WHERE lower(author) = 'robert cowley';
EXPLAIN SELECT * FROM books WHERE lower(author) = 'robert cowley';
-- Ahora si tenemos un indice para utilizar

SELECT * FROM ratings WHERE user_id = 118560;
EXPLAIN SELECT * FROM ratings WHERE user_id = 118560;
-- Se utilizo el indice de la clave primaria (es compuesto, pero no se utiliza completo).
-- El orden es importante, pues se ordena primero por user_id, y luego por isbn.

SELECT tablename, indexname, indexdef
FROM pg_indexes
WHERE schemaname = 'public';

SELECT * FROM books NATURAL JOIN ratings WHERE books.title = 'The Perfect Fool';
EXPLAIN SELECT * FROM books NATURAL JOIN ratings WHERE books.title = 'The Perfect Fool';
-- Primero se usa un indice para hallar el libro deseado
-- Luego se utiliza un indice de ISBN en rating para hallar los ratings del libro deseado
