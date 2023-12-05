from ej00 import print_results, tweets

query = {"lang": "es", "retweet_count": {"$gt": 200000}}

result = tweets.find(query).limit(10)

print_results(result)
