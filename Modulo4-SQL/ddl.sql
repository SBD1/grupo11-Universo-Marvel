DROP DATABASE IF EXISTS sbd_marvel;

CREATE DATABASE sbd_marvel;

\c sbd_marvel;

CREATE DOMAIN positive_integer integer CHECK (VALUE > 0);
CREATE DOMAIN non_negative_integer integer CHECK (VALUE >= 0);

CREATE TABLE Efeito (
    Nome varchar UNIQUE NOT NULL,
    Descricao varchar,

    PRIMARY KEY (Nome)
);

CREATE TABLE Item (
    Id serial,
    Tipo char NOT NULL,

    PRIMARY KEY (Id),
    CHECK (Tipo IN ('T', 'A', 'C', 'J', 'M'))
);

CREATE TABLE Trocavel (
    Id integer,
    Tipo char NOT NULL,

    PRIMARY KEY (Id),
    FOREIGN KEY (Id) REFERENCES Item (Id),
    CHECK (Tipo IN ('T', 'A', 'C'))
);

CREATE TABLE Equipamento (
    Id integer,
    Tipo char NOT NULL,

    PRIMARY KEY (Id),
    FOREIGN KEY (Id) REFERENCES Trocavel (Id),
    CHECK (Tipo IN ('T', 'A'))
);

CREATE TABLE Coletavel (
    Id integer,
    Tipo char NOT NULL,

    PRIMARY KEY (Id),
    FOREIGN KEY (Id) REFERENCES Item (Id),
    CHECK (Tipo IN ('J', 'M'))
);

CREATE TABLE Traje (
    Id integer,
    Nome varchar UNIQUE NOT NULL,
    Descricao varchar NOT NULL,
    Quantidade_Maxima positive_integer,
    Valor positive_integer NOT NULL,
    Nivel_Minimo positive_integer DEFAULT 1,
    Defesa positive_integer NOT NULL,
    Agilidade positive_integer NOT NULL,
    
    PRIMARY KEY (Id),
    FOREIGN KEY (Id) REFERENCES Equipamento (Id)
);

CREATE TABLE Arma (
    Id integer,
    Nome varchar UNIQUE NOT NULL,
    Descricao varchar NOT NULL,
    Quantidade_Maxima positive_integer,
    Valor positive_integer NOT NULL,
    Nivel_Minimo positive_integer DEFAULT 1,
    Dano_Maximo positive_integer NOT NULL,
    Dano_Critico positive_integer NOT NULL,
    Rolagens positive_integer NOT NULL,
    
    PRIMARY KEY (Id),
    FOREIGN KEY (Id) REFERENCES Arma (Id)
);

CREATE TABLE Consumivel (
    Id integer,
    Nome varchar UNIQUE NOT NULL,
    Descricao varchar NOT NULL,
    Quantidade_Maxima positive_integer,
    Valor positive_integer NOT NULL,
    Efeito varchar(20) NOT NULL,
    Grau positive_integer NOT NULL,
    Duracao positive_integer NOT NULL,
    Cooldown positive_integer NOT NULL,
    
    PRIMARY KEY (Id),
    FOREIGN KEY (Id) REFERENCES Trocavel (Id),
    FOREIGN KEY (Efeito) REFERENCES Efeito (Nome)
);

CREATE TABLE Joia (
    Id integer,
    Nome varchar UNIQUE NOT NULL,
    Descricao varchar NOT NULL,
    Quantidade_Maxima positive_integer DEFAULT 1,

    PRIMARY KEY (Id),
    FOREIGN KEY (Id) REFERENCES Coletavel (Id)
);

CREATE TABLE Moeda (
    Id integer,
    Nome char(5) UNIQUE NOT NULL,
    Descricao char(38) NOT NULL,

    PRIMARY KEY (Id),
    FOREIGN KEY (Id) REFERENCES Coletavel (Id),
    CHECK (Nome = 'Moeda')
);

CREATE TABLE Mapa (
    Id serial,
    Nome varchar NOT NULL,
    Ano positive_integer NOT NULL,
    Altura positive_integer NOT NULL,
    Largura positive_integer NOT NULL,
    Requisito integer,

    PRIMARY KEY (Id),
    FOREIGN KEY (Requisito) REFERENCES Item (Id),
    UNIQUE (Nome, Ano)
);

CREATE TABLE Obstaculo (
    Descricao varchar,

    PRIMARY KEY (Descricao),
    CHECK (Descricao in ('Vazio', 'Buraco', 'Montanha'))
);

CREATE TABLE Espaco (
    Latitude non_negative_integer NOT NULL,
    Longitude non_negative_integer NOT NULL,
    Mapa integer NOT NULL,
    Obstaculo varchar,

    PRIMARY KEY (Latitude, Longitude, Mapa),
    FOREIGN KEY (Mapa) REFERENCES Mapa (Id),
    FOREIGN KEY (Obstaculo) REFERENCES Obstaculo (Descricao)
);

CREATE TABLE Personagem (
    Id serial,
    Tipo varchar,

    PRIMARY KEY (Id),
    CHECK (Tipo IN ('H', 'V'))
);

CREATE TABLE Heroi (
    Id integer,
    Nome varchar UNIQUE NOT NULL,
    AgilidadeBase positive_integer NOT NULL,
    VidaBase positive_integer NOT NULL,
    Vida non_negative_integer,
    Experiencia non_negative_integer DEFAULT 0,
    Latitude non_negative_integer NOT NULL,
    Longitude non_negative_integer NOT NULL,
    Mapa integer DEFAULT 1,
    Traje integer,
    Arma integer,

    PRIMARY KEY (Id),
    FOREIGN KEY (Id) REFERENCES Personagem (Id),
    FOREIGN KEY (Mapa) REFERENCES Mapa (Id),
    FOREIGN KEY (Traje) REFERENCES Traje (Id),
    FOREIGN KEY (Arma) REFERENCES Arma (Id)
);

CREATE TABLE Vilao (
    Id integer,
    Nome varchar NOT NULL,
    Agilidade positive_integer NOT NULL,
    Vida non_negative_integer NOT NULL,
    Experiencia non_negative_integer NOT NULL,
    Dano_Maximo positive_integer NOT NULL,
    Dano_Critico positive_integer NOT NULL,
    Rolagens positive_integer NOT NULL,
    Defesa positive_integer NOT NULL,
    Latitude non_negative_integer NOT NULL,
    Longitude non_negative_integer NOT NULL,
    Mapa integer NOT NULL,

    PRIMARY KEY (Id),
    FOREIGN KEY (Id) REFERENCES Personagem (Id),
    FOREIGN KEY (Mapa) REFERENCES Mapa (Id)
);
