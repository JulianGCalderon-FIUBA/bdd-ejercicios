from ej00 import print_results, tweets

query = {
    "place": {"$ne": None},
    "lang": "es",
    "place.country": {"$nin": ["Argentina", "Brasil"]},
}

result = tweets.find(query, {"place": 1}).limit(5)

print_results(result)
