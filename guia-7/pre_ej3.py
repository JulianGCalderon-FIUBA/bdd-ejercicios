from faker import Faker
from faker.providers import person
from pymongo import MongoClient


def randomStudent():
    faker = Faker()
    faker.add_provider(person)
    student = {}
    student["padron"] = faker.random_int(90000, 110000)
    student["apellido"] = faker.last_name()
    student["nombres"] = faker.first_name()
    student["notas"] = [randomGrade() for _ in range(faker.random_int(2, 5))]
    return student


def randomGrade():
    faker = Faker()
    grade = {}
    grade["codigo_materia"] = faker.random_int(1, 100)
    grade["nota_final"] = faker.random_int(1, 10)
    return grade


client = MongoClient("localhost", 27017)
database = client.database
students = database.students

students.insert_many([randomStudent() for _ in range(1000)])

peek = students.find(limit=10)
for student in peek:
    __import__("pprint").pprint(student)
