
from ej0 import tweets, print_results

pipeline = [
    {"$group": {
        "_id": {"$cond": [
            {"$eq": ["$place.country", "Argentina"]},
            "Argentina",
            "Otros"]},
        "promedio": {
            "$avg": "$retweet_count"}
  	    }
    }
]
result = tweets.aggregate(pipeline)

print_results(result)
