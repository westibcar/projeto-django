#!/bin/sh

set -e

while ! nc -z $POSTGRES_HOST $POSTGRES_PORT; do
  echo "🟡 Waiting for Postgres Database Startup ($POSTGRES_HOST $POSTGRES_PORT) ..."
  sleep 2
done

echo "✅ Postgres Database Started Successfully ($POSTGRES_HOST:$POSTGRES_PORT)"

/venv/bin/python /app/manage.py collectstatic --noinput
/venv/bin/python /app/manage.py makemigrations --noinput
/venv/bin/python /app/manage.py migrate --noinput
/venv/bin/python /app/manage.py runserver 0.0.0.0:8000