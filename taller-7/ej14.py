
from ej00 import tweets, print_results

pipeline = [
    { "$group": {
        "_id": {
            "id": "$user_id", 
            "hora": {"$substr": ["$created_at.date", 0, 13]}},
        "cantidad_tweets": { "$sum": 1 }
        }
    },
]
result = tweets.aggregate(pipeline)

print_results(result)
