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

# Usando este Projeto com Docker Compose
```bash
docker-compose up --build
```

# Como usar os metodos com o CURL

Para interagir com a API Django Rest Framework (DRF) usando `curl`, você pode fazer requisições HTTP para criar, listar, visualizar, atualizar e deletar usuários. Vou te mostrar como você pode usar o `curl` para essas operações básicas.

### 1. Criar um Usuário

```bash
curl -X POST http://localhost:8000/api/clientes/ \
-H "Content-Type: application/json" \
-d '{
  "nome": "Samuel Souza",
  "email": "samuel@example.com",
  "telefone": "11111111111"
}'
```
**Nota:** É importante fornecer as informações corretas para cada campo, pois cada um tem um tipo específico. Por exemplo, se você inserir um texto (string) no campo destinado ao telefone, que deve conter apenas números inteiros, isso resultará em um erro de funcionamento.

### 2. Listar Todos os Clientes

```bash
curl -X GET http://localhost:8000/api/clientes/ | jq .
```

# Comando banco de dados
Nosso projeto utiliza PostgreSQL em Alpine. Portanto, para realizarmos nossos testes, precisamos instalar o psql para verificar se os usuários estão sendo registrados corretamente.

1.	Atualize os repositórios do Alpine:
```bash
apk update
```

2.	Instale o pacote postgresql-client:
```bash
apk add postgresql-client
```

3. listar todo o conteúdo de uma tabela no PostgreSQL, você pode usar o comando SQL SELECT da seguinte forma:
```bash
SELECT * FROM nome_da_tabela;
```
Esse comando vai retornar todas as colunas e todas as linhas da tabela especificada. Certifique-se de substituir nome_da_tabela pelo nome real da tabela que você deseja consultar.

4. Por exemplo, se você tem uma tabela chamada clientes, o comando seria:
```bash
SELECT * FROM clientes;
```
