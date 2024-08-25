#!/bin/sh

# Espera pelo banco de dados estar disponível
while ! nc -z $DATABASE_HOST $DATABASE_PORT; do
  echo "Waiting for PostgreSQL database connection..."
  sleep 2
done

# Executa migrações e coleta arquivos estáticos
python manage.py migrate --noinput
python manage.py collectstatic --noinput

# Inicia o Gunicorn
exec gunicorn --workers 3 --bind 0.0.0.0:8000 myproject.wsgi:application