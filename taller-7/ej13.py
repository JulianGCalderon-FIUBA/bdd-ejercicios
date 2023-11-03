
from ej00 import tweets, print_results

pipeline = [
    {"$group": {
        "_id": "$user_id",
        "cantdidad_retweets": {"$sum": "$retweet_count"}
  	    }
    },
    {"$group": {
        "_id": None,
        "maximo": {"$max": "$cantdidad_retweets"}
        }
    }
]
result = tweets.aggregate(pipeline)

print_results(result)
