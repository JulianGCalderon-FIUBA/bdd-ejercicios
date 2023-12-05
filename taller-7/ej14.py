from ej00 import print_results, tweets

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

print_results(result)
