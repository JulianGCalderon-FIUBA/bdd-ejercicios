import pymongo
from ej00 import tweets, print_results

query = {
    "place": {
        "$ne": None
    },
    "lang": "es",
    "place.country": {
        "$nin": ["Argentina", "Brasil"]
    }
}

result = tweets.find(query, {"place": 1}).limit(5)

print_results(result)
