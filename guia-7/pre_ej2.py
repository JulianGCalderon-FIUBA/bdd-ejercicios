from datetime import date, datetime

from faker import Faker
from faker.providers import date_time, person
from pymongo import MongoClient


def randomSale():
    faker = Faker()
    faker.add_provider(date_time)
    faker.add_provider(person)
    sale = {}
    sale["fecha_venta"] = datetime.combine(
        faker.date_between(date(2018, 1, 1)), datetime.min.time()
    )
    sale["DNI_comprador"] = faker.random_int(20000000, 40000000)
    sale["nombre_comprador"] = faker.last_name() + ", " + faker.first_name()
    sale["productos"] = [randomProduct() for _ in range(faker.random_int(1, 3))]
    sale["monto_total"] = sum(
        map(lambda product: product["precio_por_cantidad"], sale["productos"])
    )
    return sale


def randomProduct():
    faker = Faker()
    product = {}
    product["codigo_producto"] = faker.random_int(40, 60)
    product["cantidad_producto"] = faker.random_int(1, 10)
    product["precio_por_cantidad"] = faker.random_int(100, 1000)
    return product


client = MongoClient("localhost", 27017)
database = client.database
sales = database.sales

sales.insert_many([randomSale() for _ in range(100)])
