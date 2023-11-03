from ej0 import tweets, print_results

project = {
    "user": True,
    "retweet_count": True
}

result = tweets.find({}, project).sort("retweet_count", -1).limit(10)

print_results(result)
