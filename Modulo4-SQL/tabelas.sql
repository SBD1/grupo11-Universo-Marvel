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

CREATE TABLE espaco (
  id SERIAL PRIMARY KEY,
  latitude POSITIVE_INT NOT NULL,
  longitude POSITIVE_INT NOT NULL,
  mapa INTEGER NOT NULL,

  PRIMARY KEY (id, latitude, longitude, mapa)
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
    id SERIAL PRIMARY KEY,
    nome TEXT KEY,
    descricao TEXT NOT NULL,
    quantidade_maxima POSITIVE_INT,

    UNIQUE (nome, ano)
);

CREATE TABLE luta (
  heroi TEXT NOT NULL,
  vilao TEXT NOT NULL,
  vidaVilao NON_NEGATIVE_INT NOT NULL,
  
  PRIMARY KEY (traje, efeito)
);

CREATE TABLE mapa (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  ano NON_NEGATIVE_INT NOT NULL,
  requisito TEXT,

  UNIQUE (nome, ano)
);

CREATE TABLE moeda (
    id SERIAL PRIMARY KEY,
    nome TEXT KEY,
    descricao TEXT NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES Coletavel (id),
    CHECK (Nome = 'Moeda')
);

CREATE TABLE nivel (
  numero SERIAL UNIQUE NOT NULL,
  experienciaNecessaria NON_NEGATIVE_INT NOT NULL,
  escalaVida NON_NEGATIVE_INT NOT NULL,
  escalaAgilidade NON_NEGATIVE_INT NOT NULL,
  escalaDano NON_NEGATIVE_INT NOT NULL,
  
  PRIMARY KEY (numero),
  FOREIGN KEY (experienciaNecessaria)
);

-- CREATE TABLE obstaculo ();

-- CREATE TABLE personagem ();

-- CREATE TABLE planeta ();

-- CREATE TABLE posse ();

-- CREATE TABLE rastro ();
CREATE TABLE rastro (
  id SERIAL PRIMARY KEY,
  espaco SERIAL NOT NULL,
  heroi TEXT NOT NULL,

  PRIMARY KEY (id)
);

-- CREATE TABLE recompensa ();

-- CREATE TABLE traje ();

-- CREATE TABLE troca ();

-- CREATE TABLE trocavel ();

-- CREATE TABLE viagem ();

-- CREATE TABLE vilao ();

-- Adicionando Chaves Estrangeiras

-- ALTER TABLE acesso_equipamento ADD FOREIGN KEY () REFERENCES  ();

-- ALTER TABLE arma ADD FOREIGN KEY () REFERENCES  ();

ALTER TABLE base ADD FOREIGN KEY (latitude, longitude, mapa) REFERENCES espaco (latitude, longitude, mapa);

-- ALTER TABLE coletavel ADD FOREIGN KEY () REFERENCES  ();

-- ALTER TABLE consumivel ADD FOREIGN KEY () REFERENCES  ();

-- ALTER TABLE consumo ADD FOREIGN KEY () REFERENCES  ();

-- ALTER TABLE efeito_arma ADD FOREIGN KEY () REFERENCES  ();

-- ALTER TABLE efeito_vilao ADD FOREIGN KEY () REFERENCES  ();

-- ALTER TABLE equipamento ADD FOREIGN KEY () REFERENCES  ();

ALTER TABLE espaco ADD FOREIGN KEY (mapa) REFERENCES mapa (id);

-- ALTER TABLE estoque ADD FOREIGN KEY () REFERENCES  ();

-- ALTER TABLE heroi ADD FOREIGN KEY () REFERENCES  ();

-- ALTER TABLE imunidade_traje ADD FOREIGN KEY () REFERENCES  ();

-- ALTER TABLE imunidade_vilao ADD FOREIGN KEY () REFERENCES  ();

ALTER TABLE instancia_heroi ADD FOREIGN KEY (heroi) REFERENCES heroi (nome);
-- ALTER TABLE instancia_heroi ADD FOREIGN KEY (traje) REFERENCES traje (nome);
ALTER TABLE instancia_heroi ADD FOREIGN KEY (arma) REFERENCES arma (nome);
ALTER TABLE instancia_heroi ADD FOREIGN KEY (latitude, longitude, mapa) REFERENCES espaco (latitude, longitude, mapa);

-- ALTER TABLE joia ADD FOREIGN KEY () REFERENCES  ();

-- ALTER TABLE luta ADD FOREIGN KEY () REFERENCES  ();

-- ALTER TABLE mapa ADD FOREIGN KEY () REFERENCES  ();

-- ALTER TABLE moeda ADD FOREIGN KEY () REFERENCES  ();

-- ALTER TABLE posse ADD FOREIGN KEY () REFERENCES  ();

-- ALTER TABLE rastro ADD FOREIGN KEY () REFERENCES  ();

-- ALTER TABLE recompensa ADD FOREIGN KEY () REFERENCES  ();

-- ALTER TABLE traje ADD FOREIGN KEY () REFERENCES  ();

-- ALTER TABLE troca ADD FOREIGN KEY () REFERENCES  ();

-- ALTER TABLE trocavel ADD FOREIGN KEY () REFERENCES  ();

-- ALTER TABLE viagem ADD FOREIGN KEY () REFERENCES  ();

-- ALTER TABLE vilao ADD FOREIGN KEY () REFERENCES  ();
