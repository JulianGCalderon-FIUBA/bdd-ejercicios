from ej00 import tweets, print_results

query = {
    "user.name": { "$regex": "juan", "$options": "i"}
}

result = tweets.find(query).limit(10)

print_results(result)
