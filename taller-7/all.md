1. Hallar los tweets del usuario con userid ‘818839458’.

```python
query = {"user_id": "818839458"}

result = tweets.find(query).limit(10)
```

2. Hallar aquellos tweets que tengan más de 500000 retweets.


```python
query = {"retweet_count": {"$gt": 500000}}

result = tweets.find(query).limit(10)
```

3. Mostrar la cantidad de retweets de los tweets que se hayan hecho desde Argentina o Brasil.

```python
query = {
    "place.country": { "$regex": "argentina|brasil", "$options": "i"}
}

result = tweets.find(query).limit(10)
```

4. Hallar los usuarios que tengan tweets con 200000 o más retweets y sean en idioma espa˜nol.

```python
query = {"lang": "es", "retweet_count": {"$gt": 200000}}

result = tweets.find(query).limit(10)
```

5. Mostrar la cantidad de retweets para los tweets que no se hayan hecho en Argentina ni
Brasil, pero s´ı tengan un lugar definido y sean en espa˜nol.

```python
query = {
    "place": {"$ne": None},
    "lang": "es",
    "place.country": {"$nin": ["Argentina", "Brasil"]},
}

result = tweets.find(query, {"place": 1}).limit(5)
```

6. Mostrar los screen name de aquellos usuarios que tengan “Juan” como parte de su nombre.

```python
query = {
    "user.name": { "$regex": "juan", "$options": "i"}
}

result = tweets.find(query).limit(10)
```

7. Mostrar de los 10 tweets con más retweets, su usuario y la cantidad de retweets.
Consultas de Agregación

```python
project = {
    "user": True,
    "retweet_count": True
}

result = tweets.find({}, project).sort("retweet_count", -1).limit(10)
```

8. Mostrar de los 10 tweets con más retweets, su usuario y la cantidad de retweets. Ordenar
la salida de forma ascendente.

```python
pipeline = [
    {"$sort": {"retweet_count": -1}},
    {"$limit": 10},
    {
        "$project": {
            "retweet_count": 1,
            "user": 1,
        }
    },
    {"$sort": {"retweet_count": 1}},
]

result = tweets.aggregate(pipeline)
```

9. Encontrar los 10 hashtags más usados.

```python
pipeline = [
    {"$unwind": "$entities.hashtags"},
    {"$group": {"_id": "$entities.hashtags.text", "cantidad": {"$count": {}}}},
    {"$sort": {"cantidad": -1}},
    {"$limit": 10},
]

result = tweets.aggregate(pipeline)
```

10. Encontrar a los 5 usuarios más mencionados. (les hicieron @)

```python
pipeline = [
    {"$unwind": "$entities.user_mentions"},
    {
        "$group": {
            "_id": {
                "id": "$entities.user_mentions.id",
                "screen_name": "$entities.user_mentions.screen_name",
            },
            "cantidad": {"$sum": 1},
        }
    },
    {"$sort": {"cantidad": -1}},
    {"$limit": 5},
    {"$project": {"screen_name": "$_id.screen_name", "mentions": "$cantidad"}},
]

result = tweets.aggregate(pipeline)
```

11. Hallar la cantidad de retweets promedio para los tweets que se hayan hecho desde Argentina
y aquellos que no.

```python
pipeline = [
    {
        "$group": {
            "_id": {
                "$cond": [
                    {"$eq": ["$place.country", "Argentina"]},
                    "Argentina",
                    "Otros",
                ]
            },
            "promedio": {"$avg": "$retweet_count"},
        }
    }
]
result = tweets.aggregate(pipeline)
```

12. Por cada usuario obtener una lista de ids de tweets y el largo de la misma.

```python
pipeline = [
    {
        "$group": {
            "_id": "$user_id",
            "cant_tweets": {"$sum": 1},
            "tweets": {"$addToSet": "$_id"},
        }
    }
]
result = tweets.aggregate(pipeline)
```

13. Hallar la máxima cantidad de retweets totales que tuvo algún usuario.

```python
pipeline = [
    {"$group": {"_id": "$user_id", "cantdidad_retweets": {"$sum": "$retweet_count"}}},
    {"$group": {"_id": None, "maximo": {"$max": "$cantdidad_retweets"}}},
]

result = tweets.aggregate(pipeline)
```

14. Hallar para cada intervalo de una hora cuántos tweets realizó cada usuario.

```python
pipeline = [
    {
        "$group": {
            "_id": {"id": "$user_id", "hora": {"$substr": ["$created_at.date", 0, 13]}},
            "cantidad_tweets": {"$sum": 1},
        }
    },
    {"$limit": 5},
]

result = tweets.aggregate(pipeline)
```

