from ej00 import tweets, print_results

query = {
    "place": {
        "$ne": None
    },
    "lang": "es",
    "place.country": { "$regex": "^(argentina|brasil)", "$options": "i"}
}

result = tweets.find(query, {"place": 1}).limit(2)

print_results(result)
