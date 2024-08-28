# Use a imagem oficial do Python com Alpine
FROM python:3.12.5-alpine3.20

# Defina variáveis de ambiente para Python
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Instala dependências essenciais do sistema
RUN apk add --no-cache \
    build-base \
    libffi-dev \
    postgresql-dev \
    gcc \
    musl-dev \
    linux-headers \
    libpq

# Define o diretório de trabalho
WORKDIR /app

# Copia os requisitos para a instalação
COPY requirements.txt /app/

# Cria um ambiente virtual e instala dependências
RUN python -m venv /venv && \
    /venv/bin/pip install --upgrade pip && \
    /venv/bin/pip install -r /app/requirements.txt

# Copia o código da aplicação
COPY . /app/

# Copia o script de entrada para o contêiner
COPY scripts/entrypoint.sh /scripts/entrypoint.sh

# Ajusta as permissões do script
RUN chmod +x /scripts/entrypoint.sh

# Cria um usuário não-root para rodar a aplicação e ajusta permissões
RUN adduser --disabled-password --no-create-home useruday && \
    chown -R useruday:useruday /venv /app /scripts

# Define o PATH para incluir o ambiente virtual e scripts
ENV PATH="/scripts:/venv/bin:$PATH"

# Define o usuário não-root para rodar o contêiner
USER useruday

# Expor a porta 8000
EXPOSE 8000

# Define o script de entrada
ENTRYPOINT ["/scripts/entrypoint.sh"]