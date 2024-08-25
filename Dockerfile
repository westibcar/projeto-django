# Use uma imagem base Python
FROM python:3.10-slim

# Defina o diretório de trabalho no contêiner
WORKDIR /app

# Copie o arquivo requirements.txt para o contêiner
COPY requirements.txt /app/

# Instale as dependências do Python
RUN pip install --no-cache-dir -r requirements.txt

# Copie o restante do código da aplicação
COPY . /app/

# Copie o script de inicialização
COPY entrypoint.sh /app/entrypoint.sh

# Dê permissão de execução para o script
RUN chmod +x /app/entrypoint.sh

# Expor a porta que a aplicação usará
EXPOSE 8000

# Use o script de inicialização como o comando inicial
CMD ["/app/entrypoint.sh"]
ENTRYPOINT ["gunicorn", "--workers", "3", "--bind", "0.0.0.0:8000", "myproject.wsgi:application"]