-- Criando e Conectando ao Banco de Dados

DROP DATABASE IF EXISTS sbd_marvel;

CREATE DATABASE sbd_marvel;

\connect sbd_marvel;

-- Criando Domínios

CREATE DOMAIN POSITIVE_INT INTEGER CHECK (VALUE > 0);
CREATE DOMAIN NON_NEGATIVE_INT INTEGER CHECK (VALUE >= 0);

-- Criando Tabelas

CREATE TABLE acesso_equipamento (
  equipamento TEXT NOT NULL,
  heroi TEXT NOT NULL,

  PRIMARY KEY (equipamento, heroi)
);

CREATE TABLE arma (
  nome TEXT PRIMARY KEY,
  descricao TEXT NOT NULL,
  quantidade_maxima POSITIVE_INT,
  valor POSITIVE_INT NOT NULL,
  nivel_minimo POSITIVE_INT NOT NULL,
  dano_maximo POSITIVE_INT NOT NULL,
  dano_critico POSITIVE_INT NOT NULL,
  rolagens POSITIVE_INT NOT NULL
);

CREATE TABLE base (
  id SERIAL PRIMARY KEY,
  latitude NON_NEGATIVE_INT NOT NULL,
  longitude NON_NEGATIVE_INT NOT NULL,
  mapa INTEGER NOT NULL
);

CREATE TABLE coletavel (
  nome TEXT PRIMARY KEY,
  tipo CHAR NOT NULL,

  CHECK (tipo IN ('J', 'M'))
);

CREATE TABLE consumivel (
  nome TEXT PRIMARY KEY,
  descricao TEXT NOT NULL,
  quantidade_maxima POSITIVE_INT,
  valor POSITIVE_INT NOT NULL,
  efeito TEXT NOT NULL,
  grau POSITIVE_INT NOT NULL,
  duracao NON_NEGATIVE_INT NOT NULL,
  cooldown NON_NEGATIVE_INT NOT NULL
);

CREATE TABLE consumo (
  heroi TEXT NOT NULL,
  consumivel TEXT NOT NULL,
  vezes POSITIVE_INT NOT NULL DEFAULT 1,

  PRIMARY KEY (heroi, consumivel)
);

CREATE TABLE efeito (
  nome TEXT PRIMARY KEY
);

CREATE TABLE efeito_arma (
  arma TEXT NOT NULL,
  efeito TEXT NOT NULL,

  PRIMARY KEY (arma, efeito)
);

CREATE TABLE efeito_vilao (
  vilao TEXT NOT NULL,
  efeito TEXT NOT NULL,

  PRIMARY KEY (vilao, efeito)
);

CREATE TABLE equipamento (
  nome TEXT PRIMARY KEY,
  tipo CHAR NOT NULL,

  CHECK (tipo IN ('T', 'A'))
);

CREATE TABLE trocavel (
  id TEXT PRIMARY KEY,
  tipo CHAR NOT NULL,

  CHECK (tipo IN ('E', 'C'))
);

CREATE TABLE espaco (
  latitude POSITIVE_INT NOT NULL,
  longitude POSITIVE_INT NOT NULL,
  mapa INTEGER NOT NULL,

  PRIMARY KEY (latitude, longitude, mapa)
);

CREATE TABLE estoque (
  base INTEGER NOT NULL,
  item TEXT NOT NULL,
  quantidade POSITIVE_INT NOT NULL DEFAULT 1,

  PRIMARY KEY (base, item)
);

CREATE TABLE heroi (
  nome TEXT PRIMARY KEY,
  agilidade POSITIVE_INT NOT NULL,
  vida POSITIVE_INT NOT NULL
);

CREATE TABLE imunidade_traje (
  traje TEXT NOT NULL,
  efeito TEXT NOT NULL,

  PRIMARY KEY (traje, efeito)
);

CREATE TABLE imunidade_vilao (
  vilao TEXT NOT NULL,
  efeito TEXT NOT NULL,

  PRIMARY KEY (vilao, efeito)
);

CREATE TABLE instancia_heroi (
  id SERIAL PRIMARY KEY,
  nome TEXT UNIQUE NOT NULL,
  heroi TEXT NOT NULL,
  vida NON_NEGATIVE_INT NOT NULL,
  experiencia NON_NEGATIVE_INT NOT NULL DEFAULT 0,
  traje TEXT, 
  arma TEXT, 
  latitude NON_NEGATIVE_INT NOT NULL,
  longitude NON_NEGATIVE_INT NOT NULL,
  mapa INTEGER NOT NULL
);

CREATE TABLE item (
  id SERIAL UNIQUE NOT NULL,
  nome TEXT PRIMARY KEY,
  tipo CHAR NOT NULL,

  CHECK (tipo IN ('T', 'A', 'C', 'J', 'M'))
);

CREATE TABLE joia (
  nome TEXT PRIMARY KEY,
  descricao TEXT NOT NULL
);

CREATE TABLE luta (
  id SERIAL PRIMARY KEY,
  heroi TEXT NOT NULL,
  vilao TEXT NOT NULL,
  resultado TEXT
);

CREATE TABLE mapa (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  ano NON_NEGATIVE_INT NOT NULL,
  requisito TEXT,

  UNIQUE (nome, ano)
);

CREATE TABLE moeda (
  nome TEXT PRIMARY KEY,
  descricao TEXT NOT NULL,

  CHECK (nome = 'Moeda')
);

CREATE TABLE nivel (
  numero SERIAL PRIMARY KEY,
  experiencia_necessaria POSITIVE_INT NOT NULL,
  escala_vida POSITIVE_INT NOT NULL,
  escala_agilidade POSITIVE_INT NOT NULL,
  escala_dano POSITIVE_INT NOT NULL
);

CREATE TABLE obstaculo (
  descricao TEXT NOT NULL
);

CREATE TABLE personagem (
  nome TEXT PRIMARY KEY,
  tipo CHAR,

  CHECK (tipo IN ('H', 'V'))
);

CREATE TABLE planeta (
  mapa TEXT PRIMARY KEY,
  planeta TEXT NOT NULL
);

CREATE TABLE posse (
  item TEXT,
  heroi TEXT,
  quantidade INTEGER NOT NULL,

  PRIMARY KEY (item, heroi)
);

CREATE TABLE rastro (
  id SERIAL PRIMARY KEY,
  latitude POSITIVE_INT NOT NULL,
  longitude POSITIVE_INT NOT NULL,
  mapa INTEGER NOT NULL,
  heroi TEXT NOT NULL
);

CREATE TABLE recompensa (
  item TEXT NOT NULL
  vilao SERIAL NOT NULL
  quantidade POSITIVE_INT NOT NULL
);

CREATE TABLE traje (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  descricao TEXT NOT NULL,
  quantidade_maxima  POSITIVE_INT NOT NULL,
  valor REAL NOT NULL,
  nivel_minimo POSITIVE_INT NOT NULL,
  defesa POSITIVE_INT NOT NULL,
  agilidade POSITIVE_INT NOT NULL
);

CREATE TYPE tipo AS ENUM ('venda', 'compra');
CREATE TABLE troca (
  id SERIAL PRIMARY KEY,
  item TEXT NOT NULL,
  quantidade_item POSITIVE_INT NOT NULL,
  vendaOuCompra tipo NOT NULL,
  base INTEGER NOT NULL,
  heroi TEXT NOT NULL
);

-- CREATE TABLE trocavel ();

CREATE TABLE viagem (
  id SERIAL PRIMARY KEY,
  heroi TEXT NOT NULL,
  origem INTEGER NOT NULL,
  destino INTEGER NOT NULL,
);

CREATE TABLE vilao (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  agilidade INT NOT NULL,
  vida INT NOT NULL,
  experiencia INT NOT NULL,
  dano_maximo INT NOT NULL,
  dano_critico INT NOT NULL,
  rolagens INT NOT NULL,
  defesa INT NOT NULL,
  latitude POSITIVE_INT NOT NULL,
  longitude POSITIVE_INT NOT NULL,
  mapa INTEGER NOT NULL,
)

-- Adicionando Chaves Estrangeiras

ALTER TABLE acesso_equipamento ADD FOREIGN KEY (equipamento) REFERENCES equipamento (id);
ALTER TABLE acesso_equipamento ADD FOREIGN KEY (heroi) REFERENCES heroi (nome);

-- qual é a chave estrangeira?
-- ALTER TABLE arma ADD FOREIGN KEY () REFERENCES  ();

ALTER TABLE base ADD FOREIGN KEY (latitude, longitude, mapa) REFERENCES espaco (latitude, longitude, mapa);


-- Revisar esta parte
ALTER TABLE coletavel ADD FOREIGN KEY (nome) REFERENCES joia (nome);
ALTER TABLE coletavel ADD FOREIGN KEY (nome) REFERENCES moeda (nome);

ALTER TABLE consumivel ADD FOREIGN KEY (efeito) REFERENCES efeito (nome);

ALTER TABLE consumo ADD FOREIGN KEY (heroi) REFERENCES heroi (nome);
ALTER TABLE consumo ADD FOREIGN KEY (consumivel) REFERENCES consumivel (nome);

ALTER TABLE efeito_arma ADD FOREIGN KEY (arma) REFERENCES arma (nome);
ALTER TABLE efeito_arma ADD FOREIGN KEY (efeito) REFERENCES efeito (nome);

ALTER TABLE efeito_vilao ADD FOREIGN KEY (vilao) REFERENCES vilao (id);
ALTER TABLE efeito_vilao ADD FOREIGN KEY (efeito) REFERENCES efeito (nome);

-- qual é a chave estrangeira?
-- ALTER TABLE equipamento ADD FOREIGN KEY () REFERENCES  ();

ALTER TABLE espaco ADD FOREIGN KEY (mapa) REFERENCES mapa (id);

ALTER TABLE estoque ADD FOREIGN KEY (base) REFERENCES base (id);
ALTER TABLE estoque ADD FOREIGN KEY (item) REFERENCES item (nome);


-- qual é a chave estrangeira?
-- ALTER TABLE heroi ADD FOREIGN KEY () REFERENCES  ();

ALTER TABLE imunidade_traje ADD FOREIGN KEY (traje) REFERENCES traje (nome);
ALTER TABLE imunidade_traje ADD FOREIGN KEY (efeito) REFERENCES efeito (nome);

ALTER TABLE imunidade_vilao ADD FOREIGN KEY (vilao) REFERENCES vilao (nome);
ALTER TABLE imunidade_vilao ADD FOREIGN KEY (efeito) REFERENCES efeito (nome);

ALTER TABLE instancia_heroi ADD FOREIGN KEY (heroi) REFERENCES heroi (nome);
-- ALTER TABLE instancia_heroi ADD FOREIGN KEY (traje) REFERENCES traje (nome);
ALTER TABLE instancia_heroi ADD FOREIGN KEY (arma) REFERENCES arma (nome);
ALTER TABLE instancia_heroi ADD FOREIGN KEY (latitude, longitude, mapa) REFERENCES espaco (latitude, longitude, mapa);

ALTER TABLE joia ADD FOREIGN KEY (efeito) REFERENCES efeito (nome);




-- ALTER TABLE luta ADD FOREIGN KEY () REFERENCES  ();

ALTER TABLE mapa ADD FOREIGN KEY (requisito) REFERENCES mapa (nome);

ALTER TABLE moeda ADD FOREIGN KEY (nome) REFERENCES coletavel (nome);

ALTER TABLE posse ADD FOREIGN KEY (heroi) REFERENCES heroi  (nome);

ALTER TABLE posse ADD FOREIGN KEY (item) REFERENCES item (nome);

ALTER TABLE rastro ADD FOREIGN KEY (heroi) REFERENCES heroi (nome);

ALTER TABLE rastro ADD FOREIGN KEY (mapa) REFERENCES mapa  (id);

ALTER TABLE recompensa ADD FOREIGN KEY (item) REFERENCES item (nome);

ALTER TABLE recompensa ADD FOREIGN KEY (vilao) REFERENCES vilao (id);

ALTER TABLE traje ADD FOREIGN KEY (nome) REFERENCES equipamento (nome);

ALTER TABLE troca ADD FOREIGN KEY (heroi) REFERENCES heroi (nome);

ALTER TABLE troca ADD FOREIGN KEY (item) REFERENCES item (nome);

ALTER TABLE troca ADD FOREIGN KEY (mapa) REFERENCES mapa (id);

ALTER TABLE trocavel ADD FOREIGN KEY (id) REFERENCES item (id);

ALTER TABLE viagem ADD FOREIGN KEY (origem) REFERENCES  mapa(id);
ALTER TABLE viagem ADD FOREIGN KEY (destino) REFERENCES  mapa(id);
ALTER TABLE vilao ADD FOREIGN KEY (mapa, latitude, longitude) REFERENCES espaco(mapa, latitude, longitude);