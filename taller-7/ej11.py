from ej00 import print_results, tweets

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

print_results(result)
