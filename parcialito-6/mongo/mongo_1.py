from pymongo import MongoClient

client = MongoClient(
    "mongodb+srv://estudiante:bddfiuba@tweets.cbxukni.mongodb.net/tweets"
)

tweets = client.tweets.tweets

query = (
    tweets.find(
        {
            "favorite_count": {"$gte": 50},
            "created_at.date": {"$regex": "T15:"},
        },
        {"hashtags": {"$size": "$entities.hashtags"}, "favorite_count": True},
    )
    .sort({"favorite_count": -1})
    .limit(5)
)

for tweet in query:
    __import__("pprint").pprint(tweet)
