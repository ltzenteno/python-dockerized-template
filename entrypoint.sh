#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for PostgreSQL..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
        sleep 0.1
    done

    echo "PostgreSQL started"
fi

# TODO: uncomment the following lines when we have installed django and created the app
# Django specific commands for local dev:

python backend/manage.py migrate && python backend/manage.py runserver 0.0.0.0:8000

exec "$@"
