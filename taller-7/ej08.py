from ej00 import print_results, tweets

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

print_results(result)
