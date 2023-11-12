from pymongo import MongoClient

client = MongoClient("localhost", 27017)
database = client.database
students = database.students

# peek = students.find(limit=10)
# for student in peek:
#     __import__("pprint").pprint(student)


histogram = students.aggregate(
    [
        {
            "$project": {
                "nota_promedio": {"$avg": "$notas.nota_final"},
            }
        },
        {
            "$group": {
                "_id": {"$trunc": ["$nota_promedio", 1]},
                "cantidad_alumnos": {"$count": {}},
            }
        },
        {
            "$project": {
                "_id": False,
                "nota_promedio": "$_id",
                "cantidad_alumnos": "$cantidad_alumnos",
            }
        },
        {"$sort": {"nota_promedio": -1}},
        {"$limit": 10},
    ]
)

for student in histogram:
    __import__("pprint").pprint(student)
