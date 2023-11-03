from ej0 import tweets, print_results

query = {
    "lang": "es",
    "retweet_count": {
        "$gt": 200000
    }
}

result = tweets.find(query).limit(10)

print_results(result)
