FROM postgres:14.1-alpine

LABEL author="BDD-Fiuba"
LABEL description="Postgres Image for BDD-FIUBA"
LABEL version="1.0"

COPY init/* /docker-entrypoint-initdb.d/
