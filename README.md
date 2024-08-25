# Projeto para Uday Academy
Este projeto esta sendo criado para os cursos da Uday Academy, este projeto é para cadastro de clientes desenvolvido com Django e Python

## Executando
Para você executar este código você vai precisar dos seguintes passos.
#### 1. Baixar o repositório

```bash
git clone git@github.com:westibcar/projeto-django.git
cd projeto-django
```

#### 2. Crie um ambiente virtual com o venv
```bash
python -m venv venv
```

#### 3. Agora ative o ambiente virtual 
```bash
source venv/bin/activate
```

# Migração do Bando de Dados
```bash
python manage.py makemigrations
python manage.py migrate
```

#### 4. Execute a aplicação
```bash
python manage.py runserver
```

NOTA: Agora acesse com seu Browser http://127.0.0.1:8000/

#### 4. Variaveis
- 4.1 - localmente na sua máquina copie o .env-example que esta no diretorio env-example e cole no mesmo lugar ele vai aparece como ".env-example copy" altere para .env
- 4.2 - agora gere um SECRET_KEY com o comando abaixo, e depoi cole na variavel SECRET_KEY.

```bash
python -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())'
```



