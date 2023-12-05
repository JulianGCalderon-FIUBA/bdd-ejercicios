from pprint import pprint

import pymongo

client = pymongo.MongoClient(
    "mongodb+srv://estudiante:bddfiuba@tweets.cbxukni.mongodb.net/tweets"
)
database = client.tweets
collection = database.tweets

tweets = collection


def print_results(results):
    for result in results:
        pprint(result)


results = tweets.find().limit(5)
print_results(results)
