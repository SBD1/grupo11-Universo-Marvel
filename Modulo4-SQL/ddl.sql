DROP DATABASE IF EXISTS sbd_marvel;

CREATE DATABASE sbd_marvel;

\c sbd_marvel;

CREATE DOMAIN positive_integer integer CHECK (VALUE > 0);


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
    Quantidade_Maxima positive_integer,

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