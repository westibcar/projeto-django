#!/bin/sh

set -e

# Função para checar a conectividade com o banco de dados
check_postgres() {
    while ! nc -z $POSTGRES_HOST $POSTGRES_PORT; do
        echo "🟡 Waiting for Postgres Database Startup ($POSTGRES_HOST:$POSTGRES_PORT) ..."
        sleep 2
    done
    echo "✅ Postgres Database Started Successfully ($POSTGRES_HOST:$POSTGRES_PORT)"
}

# Verifica a presença de variáveis essenciais
if [ -z "$POSTGRES_HOST" ] || [ -z "$POSTGRES_PORT" ]; then
  echo "❌ POSTGRES_HOST ou POSTGRES_PORT não configurados. Verifique suas variáveis de ambiente."
  exit 1
fi

# Checa a conectividade com o PostgreSQL
check_postgres

# Coleta arquivos estáticos
/venv/bin/python /app/manage.py collectstatic --noinput

# Aplica as migrações do banco de dados
/venv/bin/python /app/manage.py makemigrations --noinput
/venv/bin/python /app/manage.py migrate --noinput

# Executa o servidor
exec /venv/bin/gunicorn udayacademy.wsgi:application --bind 0.0.0.0:8000 --workers 3 --threads 2 --worker-class gthread