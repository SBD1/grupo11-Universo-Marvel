DROP DATABASE IF EXISTS sbd_marvel;

CREATE DATABASE sbd_marvel;

\c sbd_marvel;

CREATE DOMAIN positive_integer integer CHECK (VALUE > 0);

CREATE TABLE Efeito (
    Nome varchar,
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
    Id serial,
    Tipo char NOT NULL,

    PRIMARY KEY (Id),
    CHECK (Tipo IN ('T', 'A', 'C'))
);

CREATE TABLE Equipamento (
    Id serial,
    Tipo char NOT NULL,

    PRIMARY KEY (Id),
    CHECK (Tipo IN ('T', 'A'))
);

CREATE TABLE Coletavel (
    Id serial,
    Tipo char NOT NULL,

    PRIMARY KEY (Id),
    CHECK (Tipo IN ('J', 'M'))
);

CREATE TABLE Traje (
    Id serial,
    Nome varchar NOT NULL,
    Descricao varchar NOT NULL,
    Quantidade_Maxima positive_integer,
    Valor positive_integer NOT NULL,
    Nivel_Minimo positive_integer DEFAULT 1,
    Defesa positive_integer NOT NULL,
    Agilidade positive_integer NOT NULL,
    
    PRIMARY KEY (Id),
    UNIQUE (Nome)
);

CREATE TABLE Arma (
    Id serial,
    Nome varchar NOT NULL,
    Descricao varchar NOT NULL,
    Quantidade_Maxima positive_integer,
    Valor positive_integer NOT NULL,
    Nivel_Minimo positive_integer DEFAULT 1,
    Dano_Maximo positive_integer NOT NULL,
    Dano_Critico positive_integer NOT NULL,
    Rolagens positive_integer NOT NULL,
    
    PRIMARY KEY (Id),
    UNIQUE (Nome)
);

CREATE TABLE Consumivel (
    Id serial,
    Nome varchar NOT NULL,
    Descricao varchar NOT NULL,
    Quantidade_Maxima positive_integer,
    Valor positive_integer NOT NULL,
    Efeito varchar(20) NOT NULL,
    Grau positive_integer NOT NULL,
    Duracao positive_integer NOT NULL,
    Cooldown positive_integer NOT NULL,
    
    PRIMARY KEY (Id),
    FOREIGN KEY (Efeito) REFERENCES Efeito (Nome),
    UNIQUE (Nome)
);

CREATE TABLE Joia (
    Id serial,
    Nome varchar NOT NULL,
    Descricao varchar NOT NULL,
    Quantidade_Maxima positive_integer,

    PRIMARY KEY (Id),
    UNIQUE (Nome)
);

CREATE TABLE Moeda (
    Id serial,
    Nome char(5) NOT NULL,
    Descricao char(38) NOT NULL,

    PRIMARY KEY (Id),
    UNIQUE (Nome),
    CHECK (Id = 1)
);