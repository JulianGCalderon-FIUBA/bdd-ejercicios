from ej00 import print_results, tweets

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

print_results(result)
