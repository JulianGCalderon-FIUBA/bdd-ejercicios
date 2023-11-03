
from ej00 import tweets, print_results

pipeline = [
    {"$unwind": "$entities.hashtags"},
    {"$group": {
        "_id": "$entities.hashtags.text",
        "cantidad": {"$sum": 1}
  	}
    },
    {"$sort": {"cantidad": -1}},
    {"$limit": 10}
]

result = tweets.aggregate(pipeline)

print_results(result)