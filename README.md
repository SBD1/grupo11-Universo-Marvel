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

## Visualização do projeto final

Para visualizar como o MER foi transformado em SQL, como o banco de dados de comunica com a interface e como funciona a usabilidade do jogo, basta clicar [aqui](https://drive.google.com/drive/folders/19rWKBuawbh4axp8h0WZ_2uUE_Qs4NVn1?usp=sharing).

## Entregas

| Módulo  | Entrega                           |
| ---------- | ---------------------------------- |
| 1 | [Versão mais recente](https://github.com/SBD1/grupo11-Universo-Marvel/tree/triggers/Modulo1-MER) |
| 2 | [Versão mais recente](https://github.com/SBD1/grupo11-Universo-Marvel/tree/triggers/Modulo2-MRel)             |
| 3 | [Versão mais recente](https://github.com/SBD1/grupo11-Universo-Marvel/tree/triggers/Modulo3-Normalizacao)           |
| 4 | [Versão mais recente](https://github.com/SBD1/grupo11-Universo-Marvel/tree/triggers/Modulo4-SQL)            |
| 5 | [Entrega](https://github.com/SBD1/grupo11-Universo-Marvel/tree/triggers/Modulo5)            |
| Final | [Entrega](https://github.com/SBD1/grupo11-Universo-Marvel/tree/main)             |
