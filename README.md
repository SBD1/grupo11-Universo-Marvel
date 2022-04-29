# [Universo Marvel](https://sbd1.github.io/grupo11-Universo-Marvel)

## Descrição

Repositório destinado a disciplina de Sistemas de bancos de dados (SBD1)

## Alunos

| Matrícula  | Aluno(a)                           |
| ---------- | ---------------------------------- |
| 18/0118005 | Carlos Rafael Vasconcelos de Matos |
| 16/0124034 | Helena Bretas Goulart              |
| 18/0121995 | Herick de Carvalho Lima            |
| 16/0129443 | Julio Cesar Litwin Lima            |
| 18/0129147 | Pedro de Miranda Haick             |
| 18/0113259 | Felipe Correia Andrade             |

## Professor

- Maurício Serrano

## Como rodar o projeto

1. Entre na pasta src

```
$ cd src
```

2. Inicialize o banco

- Insira os comandos dos arquivos 'sql/initdb.sql' e 'sql/populate.sql' no banco respectivamente ou faça isso automaticamente com o psql:

```
$ psql
$ \i sql/initdb.sql
$ \i sql/populate.sql
```

- Isso deve criar um banco de dados chamado 'sbd_marvel' no postgres e inserir as tabelas e tuplas necessárias

3. Inserir as configurações do banco

- Abra o arquivo 'db.py' e edite as configurações para conexão do banco (nome de usuário e senha)

4. Instale as dependências com pip

```
$ pip install -r requirements.txt
```

5. Rode o projeto

```
$ python main.py
```
