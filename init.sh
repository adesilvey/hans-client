#!/bin/bash

echo "Waiting for PostgreSQL to start..."
until pg_isready -h "localhost" -p "$POSTGRES_PORT"; do
  sleep 2
done

echo "PostgreSQL is ready!"

envsubst < /docker-entrypoint-initdb.d/init.sql.template > /docker-entrypoint-initdb.d/init.sql

psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -a -f /docker-entrypoint-initdb.d/init.sql
