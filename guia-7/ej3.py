from pymongo import MongoClient

client = MongoClient("localhost", 27017)
database = client.database
students = database.sales
