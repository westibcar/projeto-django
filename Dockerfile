FROM python:3.12.5-alpine3.20

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

# Copia todos os arquivos do projeto para o diretório de trabalho no contêiner
COPY . /app/

# Copia o diretório scripts para o contêiner
COPY scripts /scripts

# Cria um ambiente virtual, instala dependências e ajusta permissões
RUN python -m venv /venv && \
  /venv/bin/pip install --upgrade pip && \
  /venv/bin/pip install -r /app/requirements.txt && \
  adduser --disabled-password --no-create-home useruday && \
  chown -R useruday:useruday /venv && \
  chown -R useruday:useruday /app && \
  chmod -R +x /scripts/entrypoint.sh

# Define o PATH para incluir o ambiente virtual e scripts
ENV PATH="/scripts:/venv/bin:$PATH"

USER useruday
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 8000