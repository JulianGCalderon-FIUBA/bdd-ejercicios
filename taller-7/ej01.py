from ej00 import tweets, print_results

query = {
    "user_id":  "818839458"
}

result = tweets.find(query).limit(10)

print_results(result)
