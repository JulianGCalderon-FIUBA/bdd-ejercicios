from ej0 import tweets, print_results

query = {
    "retweet_count": {
        "$gt": 500000
    }
}

result = tweets.find(query).limit(10)

print_results(result)
