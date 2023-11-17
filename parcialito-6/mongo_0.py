from pymongo import MongoClient

client = MongoClient(
    "mongodb+srv://estudiante:bddfiuba@tweets.cbxukni.mongodb.net/tweets"
)

tweets = client.tweets.tweets

__import__("pprint").pprint(tweets.find_one())
