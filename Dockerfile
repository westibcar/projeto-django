# Use uma imagem base oficial do Python
FROM python:3.12-slim

# Defina o diretório de trabalho dentro do container
WORKDIR /app

# Copie o arquivo requirements.txt para o diretório de trabalho
COPY requirements.txt .

# Instale as dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt

# Copie todo o conteúdo do projeto para o diretório de trabalho
COPY . .

# Defina as variáveis de ambiente para o Django
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Exponha a porta que o gunicorn usará
EXPOSE 8000

# Execute as migrações e inicie o servidor usando gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "udayacademy.wsgi:application"]