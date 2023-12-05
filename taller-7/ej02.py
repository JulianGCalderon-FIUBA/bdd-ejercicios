from ej00 import print_results, tweets

query = {"retweet_count": {"$gt": 500000}}

result = tweets.find(query).limit(10)

print_results(result)
