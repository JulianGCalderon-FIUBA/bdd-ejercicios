from pymongo import MongoClient

client = MongoClient("localhost", 27017)
database = client.database
sales = database.sales

evolution = sales.aggregate(
    [
        {"$match": {"productos.codigo_producto": {"$in": [50]}}},
        {
            "$project": {
                "mes": {"$month": "$fecha_venta"},
                "año": {"$year": "$fecha_venta"},
                "comprador": "$DNI_comprador",
            }
        },
        {
            "$group": {
                "_id": {"año": "$año", "mes": "$mes"},
                "compradores": {"$addToSet": "$comprador"},
            }
        },
        {"$project": {"cant_compradores": {"$size": "$compradores"}}},
        {"$sort": {"_id.año": -1, "_id.mes": -1}},
        {"$limit": 10},
        {"$sort": {"_id.año": 1, "_id.mes": 1}},
    ]
)

for sale in evolution:
    __import__("pprint").pprint(sale)

frequents = sales.aggregate(
    [
        {"$match": {"productos.codigo_producto": {"$in": [50]}}},
        {"$unwind": "$productos"},
        {
            "$group": {
                "_id": {
                    "codigo_pedido": "$_id",
                    "codigo_producto": "$productos.codigo_producto",
                },
            }
        },
        {"$match": {"_id.codigo_producto": {"$ne": 50}}},
        {
            "$group": {
                "_id": "$_id.codigo_producto",
                "cantidad": {"$count": {}},
            },
        },
        {"$sort": {"cantidad": -1}},
        {"$limit": 10},
        {"$sort": {"cantidad": 1}},
    ]
)

for sale in frequents:
    __import__("pprint").pprint(sale)
