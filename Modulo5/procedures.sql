-- Herança de Item

-- INSERT
CREATE OR REPLACE FUNCTION insert_trocavel()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $insert_trocavel$
DECLARE tipo CONSTANT TEXT := UPPER(SUBSTRING(TG_TABLE_NAME::regclass::text, 1, 1));
BEGIN
  INSERT INTO item (nome, tipo) VALUES (NEW.nome, tipo);
  INSERT INTO trocavel (nome, tipo) VALUES (NEW.nome, tipo);
  RETURN NEW;
END;
$insert_trocavel$;

CREATE OR REPLACE FUNCTION insert_equipamento()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $insert_equipamento$
DECLARE tipo CONSTANT TEXT := UPPER(SUBSTRING(TG_TABLE_NAME::regclass::text, 1, 1));
BEGIN
  INSERT INTO item (nome, tipo) VALUES (NEW.nome, tipo);
  INSERT INTO trocavel (nome, tipo) VALUES (NEW.nome, tipo);
  INSERT INTO equipamento VALUES (NEW.nome, tipo);
  RETURN NEW;
END;
$insert_equipamento$;

-- DELETE
CREATE OR REPLACE FUNCTION delete_equipamento()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $delete_equipamento$
BEGIN
  DELETE FROM item WHERE nome = OLD.nome;
  DELETE FROM trocavel WHERE nome = OLD.nome;
  DELETE FROM equipamento WHERE nome = OLD.nome;
  RETURN OLD;
END;
$delete_equipamento$;

CREATE OR REPLACE FUNCTION insert_coletavel()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $insert_coletavel$
DECLARE tipo CONSTANT TEXT := UPPER(SUBSTRING(TG_TABLE_NAME::regclass::text, 1, 1));
BEGIN
  INSERT INTO item (nome, tipo) VALUES (NEW.nome, tipo);
  INSERT INTO coletavel (nome, tipo) VALUES (NEW.nome, tipo);
  RETURN NEW;
END;
$insert_coletavel$;

-- DELETE
CREATE OR REPLACE FUNCTION delete_coletavel()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $delete_coletavel$
BEGIN
  DELETE FROM item WHERE nome = OLD.nome;
  DELETE FROM coletavel WHERE nome = OLD.nome;
  RETURN OLD;
END;
$delete_coletavel$;

-- DELETE
CREATE OR REPLACE FUNCTION delete_item()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $delete_item$
BEGIN
  DELETE FROM arma WHERE nome = OLD.nome;
  DELETE FROM traje WHERE nome = OLD.nome;
  DELETE FROM equipamento WHERE nome = OLD.nome;
  DELETE FROM consumivel WHERE nome = OLD.nome;
  DELETE FROM trocavel WHERE nome = OLD.nome;

  DELETE FROM joia WHERE nome = OLD.nome;
  DELETE FROM moeda WHERE nome = OLD.nome;
  DELETE FROM coletavel WHERE nome = OLD.nome;

  DELETE FROM item WHERE nome = OLD.nome;
  RETURN OLD;
END;
$delete_item$;

-- Herança de Personagem

-- INSERT
CREATE OR REPLACE FUNCTION insert_personagem()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $insert_personagem$
DECLARE tipo CONSTANT TEXT := UPPER(SUBSTRING(TG_TABLE_NAME::regclass::text, 1, 1));
BEGIN
  INSERT INTO personagem (nome, tipo) VALUES (NEW.nome, tipo);
  RETURN NEW;
END;
$insert_personagem$;

-- DELETE
CREATE OR REPLACE FUNCTION delete_personagem()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $delete_personagem$
BEGIN
  DELETE FROM personagem WHERE nome = OLD.nome;
  RETURN OLD;
END;
$delete_personagem$;

-- INSERT
CREATE OR REPLACE FUNCTION insert_heroi()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $insert_heroi$
DECLARE tipo CONSTANT TEXT := UPPER(SUBSTRING(TG_TABLE_NAME::regclass::text, 1, 1));
BEGIN
  INSERT INTO heroi (nome, agilidade, vida) VALUES (NEW.nome, agilidade, vida);
  RETURN NEW;
END;
$insert_heroi$;

-- DELETE
CREATE OR REPLACE FUNCTION delete_heroi()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $delete_heroi$
BEGIN
  DELETE FROM heroi WHERE nome = OLD.nome;
  RETURN OLD;
END;
$delete_heroi$;

-- INSERT
CREATE OR REPLACE FUNCTION insert_vilao()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $insert_vilao$
DECLARE tipo CONSTANT TEXT := UPPER(SUBSTRING(TG_TABLE_NAME::regclass::text, 1, 1));
BEGIN
  INSERT INTO vilao (nome, agilidade, vida, experiencia, dano_maximo, dano_critico, rolagens, defesa) VALUES (NEW.nome, agilidade, vida, experiencia, dano_maximo, dano_critico, rolagens, defesa);
  RETURN NEW;
END;
$insert_vilao$;

-- DELETE
CREATE OR REPLACE FUNCTION delete_vilao()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $delete_vilao$
BEGIN
  DELETE FROM vilao WHERE nome = OLD.nome;
  RETURN OLD;
END;
$delete_vilao$;
