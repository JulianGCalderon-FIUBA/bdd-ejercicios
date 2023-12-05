from ej00 import print_results, tweets

pipeline = [
    {"$unwind": "$entities.hashtags"},
    {"$group": {"_id": "$entities.hashtags.text", "cantidad": {"$count": {}}}},
    {"$sort": {"cantidad": -1}},
    {"$limit": 10},
]

result = tweets.aggregate(pipeline)

print_results(result)
