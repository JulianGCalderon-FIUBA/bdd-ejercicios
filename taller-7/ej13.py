from ej00 import print_results, tweets

pipeline = [
    {"$group": {"_id": "$user_id", "cantdidad_retweets": {"$sum": "$retweet_count"}}},
    {"$group": {"_id": None, "maximo": {"$max": "$cantdidad_retweets"}}},
]
result = tweets.aggregate(pipeline)

print_results(result)
