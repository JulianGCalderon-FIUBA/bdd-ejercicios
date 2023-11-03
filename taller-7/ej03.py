from ej00 import tweets, print_results

query = {
    "place.country": { "$regex": "argentina|brasil", "$options": "i"}
}

result = tweets.find(query).limit(10)

print_results(result)
