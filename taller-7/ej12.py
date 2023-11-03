
from ej0 import tweets, print_results

pipeline = [
    {"$group": {
        "_id": "$user_id",
        "cant_tweets": { "$sum": 1 },
        "tweets": {"$addToSet": "$_id"}
  	    }
    }
]
result = tweets.aggregate(pipeline)

print_results(result)
