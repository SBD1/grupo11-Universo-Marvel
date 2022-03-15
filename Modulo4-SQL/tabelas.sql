CREATE DOMAIN POSITIVE_INT INTEGER CHECK (VALUE > 0);
CREATE DOMAIN NON_NEGATIVE_INT INTEGER CHECK (VALUE >= 0);

CREATE TABLE acesso_equipamento (
  equipamento TEXT NOT NULL,
  heroi TEXT NOT NULL,

  PRIMARY KEY (equipamento, heroi)
);

CREATE TABLE arma (
  nome TEXT UNIQUE NOT NULL,
  descricao TEXT NOT NULL,
  quantidade_maxima POSITIVE_INT,
  valor POSITIVE_INT NOT NULL,
  nivel_minimo POSITIVE_INT NOT NULL,
  dano_maximo POSITIVE_INT NOT NULL,
  dano_critico POSITIVE_INT NOT NULL,
  rolagens POSITIVE_INT NOT NULL,

  PRIMARY KEY (nome)
);

CREATE TABLE base (
  id SERIAL UNIQUE NOT NULL,
  latitude NON_NEGATIVE_INT NOT NULL,
  longitude NON_NEGATIVE_INT NOT NULL,
  nome_mapa TEXT NOT NULL,
  ano_mapa TEXT NOT NULL,

  PRIMARY KEY (latitude, longitude, nome_mapa, ano_mapa)
);

CREATE TABLE coletavel (
  nome TEXT UNIQUE NOT NULL,
  tipo CHAR NOT NULL,

  PRIMARY KEY (nome),
  CHECK (tipo IN ('J', 'M'))
)

CREATE TABLE consumivel (
  nome TEXT UNIQUE NOT NULL,
  descricao TEXT NOT NULL,
  quantidade_maxima POSITIVE_INT,
  valor POSITIVE_INT NOT NULL,
  efeito TEXT NOT NULL,
  grau POSITIVE_INT NOT NULL,
  duracao NON_NEGATIVE_INT NOT NULL,
  cooldown NON_NEGATIVE_INT NOT NULL,

  PRIMARY KEY (nome)
);

CREATE TABLE consumo (
  heroi TEXT NOT NULL,
  consumivel TEXT NOT NULL,
  vezes POSITIVE_INT NOT NULL DEFAULT 1,

  PRIMARY KEY (heroi, consumivel)
);

CREATE TABLE efeito (
  nome TEXT UNIQUE NOT NULL,
  descricao TEXT UNIQUE NOT NULL,

  PRIMARY KEY (nome)
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
  nome TEXT UNIQUE NOT NULL,
  tipo CHAR NOT NULL,

  PRIMARY KEY (nome),
  CHECK (tipo IN ('T', 'A'))
);

CREATE TABLE estoque (
  base INTEGER NOT NULL,
  item TEXT NOT NULL,
  quantidade POSITIVE_INT NOT NULL DEFAULT 1,

  PRIMARY KEY (base, item)
);

CREATE TABLE heroi (
  nome TEXT UNIQUE NOT NULL,
  agilidade POSITIVE_INT NOT NULL,
  vida POSITIVE_INT NOT NULL,

  PRIMARY KEY (nome)
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

CREATE TABLE item (
  id SERIAL UNIQUE NOT NULL,
  nome TEXT UNIQUE NOT NULL,
  tipo CHAR NOT NULL,

  PRIMARY KEY (nome),
  CHECK (tipo IN ('T', 'A', 'C', 'J', 'M'))
);

CREATE TABLE joia ();
CREATE TABLE luta ();
CREATE TABLE mapa ();
CREATE TABLE moeda ();
CREATE TABLE nivel ();
CREATE TABLE obstaculo ();
CREATE TABLE personagem ();
CREATE TABLE planeta ();
CREATE TABLE posse ();
CREATE TABLE rastro ();
CREATE TABLE recompensa ();
CREATE TABLE traje ();
CREATE TABLE troca ();
CREATE TABLE trocavel ();
CREATE TABLE viagem ();
CREATE TABLE vilao ();