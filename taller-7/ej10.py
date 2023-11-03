
from ej0 import tweets, print_results

pipeline = [
    {"$unwind": "$entities.user_mentions"},
    {"$group": {
        "_id": {
            "id": "$entities.user_mentions.id", 
            "screen_name": "$entities.user_mentions.screen_name"
        },
        "cantidad": {"$sum": 1},
    }},
    {"$sort": {"cantidad": -1}},
    {"$limit": 5},
    {"$project": 
        {"screen_name": "$_id.screen_name", "mentions": "$cantidad"}
    }
]

result = tweets.aggregate(pipeline)

print_results(result)
