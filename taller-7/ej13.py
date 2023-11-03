
from ej0 import tweets, print_results

pipeline = [
    {"$group": {
        "_id": "$user_id",
        "max_rts": {"$max": "$retweet_count"}
  	    }
    },
    {"$group": {
        "_id": None,
        "maximo": {"$max": "$max_rts"}
        }
    }
]
result = tweets.aggregate(pipeline)

print_results(result)
