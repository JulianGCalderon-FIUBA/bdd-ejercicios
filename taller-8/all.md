1. Muestre en orden alfabético, los nombres de las primeras 10 personas
apellidadas ‘Smith’.

```neo4j
MATCH (p:Person)
WHERE p.surname =~ "(?i)smith"
RETURN p
ORDER BY p.name, p.surname
LIMIT 10
```

2. Muestre la marca y modelos de los vehículos de año 2013.

```neo4j
MATCH (v:Vehicle {year:"2013"})
RETURN v.make, v.model
```

3. Muestre el nombre, apellido y rango de los oficiales cuyos apellidos
comiencen con ’Mc’, ordenados por rango (rank).

```neo4j
MATCH (o:Officer)
WHERE o.surname STARTS WITH "Mc"
RETURN o.name, o.surname, o.rank
ORDER BY o.rank
```

4. Muestre el grafo de las locations en el área M30. Cuantos nodos hay?

```neo4j
MATCH (l:Location)
WHERE l.postcode STARTS WITH "M30"
RETURN l

MATCH (l:Location)-[:LOCATION_IN_AREA]->(a:Area {areaCode:"M30"})
RETURN l
```

5. Muestre el grafo de todos que conocen a alguien que conoce a Gordon
Craig.

```neo4j
MATCH (p:Person)-[:KNOWS]->(common:Person),
      (common)-[:KNOWS]->(gordon:Person)
WHERE gordon.surname + gordon.name = "GordonCraig"
RETURN p, common, gordon
```

6. Muestre las personas que están a distancia 3 de Gordon Craig.

MATCH rel=(p:Person)-[:KNOWS*]->(gordon:Person {surname:"Gordon", name:"Craig"})
WHERE length(rel) = 3
RETURN p

MATCH rel=(p:Person)-[:KNOWS*3..3]->(gordon:Person)
WHERE  gordon.surname = "Gordon" AND gordon.name = "Craig"
RETURN p, rel

```
```neo4j
7. Muestre las personas conocidas de Roger Brooks que no participaron
en ningún crimen.

```neo4j
MATCH (roger:Person)-[:KNOWS]->(p:Person)
WHERE NOT (p)-[:PARTY_TO]->(:Crime) 
    AND roger.surname = "Brooks" AND roger.name = "Roger"
RETURN p
```

8. Muestre el camino más corto de Judith Moore a Richard Green.

```neo4j
MATCH path = shortestPath(
        (judith:Person {name: "Judith", surname: "Moore"})-[:KNOWS*]-
            (richard:Person {name: "Richard", surname: "Green"}))
RETURN path
```

9. Encuentre los oficiales que investigaron los crímenes cometidos en 165
Laurel Street.

```neo4j
MATCH (o:Officer)<-[:INVESTIGATED_BY]-(c:Crime),
    (c)-[:OCCURRED_AT]->(l:Location {address:"165 Laurel Street"})
RETURN o, c, l
```

10. Obtenga el modelo, marca y año del auto más viejo de la base.

```neo4j
MATCH (a:Vehicle)
RETURN a.model, a.make, a.year
ORDER BY a.year ASC
LIMIT 1
```

11. ¿A qué distancia se encuentra el auto más viejo de Roger Brooks?

```neo4j
MATCH (a:Vehicle)
WITH min(a.year) as oldest_year
MATCH r=shortestPath((oldest:Vehicle)-[*]-(roger:Person {name:"Roger", surname:"Brooks"}))
WHERE oldest.year = oldest_year
    AND roger.name = "Roger" AND roger.surname = "Brooks"
return oldest, r
```

12. Devuelva el nombre y apellido de personas que conozcan más de 10
personas.

```neo4j
MATCH  (p:Person)-[r:KNOWS]->(q:Person)
WITH p, count(r) as amistades
WHERE amistades >= 10
RETURN p, amistades
```

13. Cuantas personas hay en la base? Cuantos tiene teléfono? Cuantos
mail?

```neo4j
MATCH (p:Person)
RETURN count(p)

MATCH (p:Person)-[:HAS_PHONE]-()
RETURN count(p)

MATCH (p:Person)-[:HAS_EMAIL]-()
RETURN count(p)
```

