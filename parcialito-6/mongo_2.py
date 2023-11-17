from pymongo import MongoClient

client = MongoClient(
    "mongodb+srv://estudiante:bddfiuba@tweets.cbxukni.mongodb.net/tweets"
)

tweets = client.tweets.tweets

query = tweets.aggregate(
    [
        {"$addFields": {"numberOfHashtags": {"$size": "$entities.hashtags"}}},
        {"$match": {"numberOfHashtags": {"$gt": 3}}},
        {"$unwind": "$entities.hashtags"},
        {
            "$group": {
                "_id": "$entities.hashtags.text",
                "users": {"$addToSet": {"id": "$user_id", "name": "$user.screen_name"}},
                "maxRetweets": {"$max": "$retweet_count"},
                "minRetweets": {"$min": "$retweet_count"},
                "avgRetweets": {"$avg": "$retweet_count"},
            }
        },
        {"$limit": 5},
    ]
)

for tweet in query:
    __import__("pprint").pprint(tweet)
