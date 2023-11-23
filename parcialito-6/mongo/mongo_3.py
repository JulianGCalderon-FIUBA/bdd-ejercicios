from pymongo import MongoClient

client = MongoClient(
    "mongodb+srv://estudiante:bddfiuba@tweets.cbxukni.mongodb.net/tweets"
)

tweets = client.tweets.tweets

query = tweets.aggregate(
    [
        {
            # Primero, nos quedamos con todos los
            # tweets cuyo idioma sea español o portugues,
            # y cuyo pais sea Brasil
            "$match": {
                "lang": {"$regex": "es|pt"},
                "place.country": "Brasil",
            },
        },
        {
            "$group": {
                # Agrupamos todas las respuestas a un mismo tweet.
                # Si ademas, el tweet no responde a nada, estará agrupado junto
                # a sus respuestas
                "_id": {
                    "$ifNull": [
                        "$in_reply_to_status_id_str",
                        "$_id",
                    ]
                },
                # Por cada grupo, guardamos cierta
                #  información sobre cada tweet/respuesta
                "tweets": {
                    "$push": {
                        "tweet_id": "$_id",
                        "text": "$full_text",
                        "user": "$user",
                        "created_at": "$created_at.date",
                    }
                },
                # Por cada grupo, creamos un set con
                #  los distintos 'retweet_count'.
                # Esto no se utiliza, por lo que podria omitirse
                "languages": {"$addToSet": "$retweet_count"},
            },
        },
        {
            "$project": {
                # Nos quedamos con el tweet suelto
                #  (aquel cuyo id es el mismo al id del grupo)
                # Hay grupos que no tendrán un tweet, puesto que son
                #  respuestas dentro de respuestas
                "tweet": {
                    "$arrayElemAt": [
                        {
                            "$filter": {
                                "input": "$tweets",
                                "as": "reply",
                                "cond": {
                                    "$eq": ["$$reply.tweet_id", "$_id"],
                                },
                            },
                        },
                        0,
                    ]
                },
                # Creamos una lista con todas las respuestas
                #  al tweet suelto (aquellas cuyo id es
                #  distinto al id del grupo).
                # Ordenamos todas las respuestas segun
                #  la fecha de creacion (ascendente)
                "replies": {
                    "$sortArray": {
                        "input": {
                            "$filter": {
                                "input": "$tweets",
                                "as": "reply",
                                "cond": {
                                    "$ne": ["$$reply.tweet_id", "$_id"],
                                },
                            },
                        },
                        "sortBy": {"created_at": 1},
                    }
                },
                # Mostramos 'avg_retweets', pero no existe,
                #  por lo que no se muestra
                "avg_retweets": 1,
            },
        },
        {"$limit": 15},
    ]
)

for tweet in query:
    __import__("pprint").pprint(tweet)
