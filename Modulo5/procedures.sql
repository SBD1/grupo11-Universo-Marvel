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
  DELETE FROM coordenada WHERE nome = OLD.nome;
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

-- GET

-- VILAO

CREATE OR REPLACE FUNCTION get_vida_vilao(id_vilao INTEGER)
    RETURNS INTEGER AS $$
BEGIN
  RETURN 
  (SELECT vida FROM instancia_vilao WHERE id=id_vilao);
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_type_vilao(id_vilao INTEGER)
    RETURNS INTEGER AS $$
BEGIN
  RETURN 
  (SELECT vilao FROM instancia_vilao WHERE id=id_vilao);
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_latitude_vilao(id_vilao INTEGER)
    RETURNS INTEGER AS $$
BEGIN
  RETURN 
  (SELECT latitude FROM instancia_vilao WHERE id=id_vilao);
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_longitude_vilao(id_vilao INTEGER)
    RETURNS INTEGER AS $$
BEGIN
  RETURN 
  (SELECT longetude FROM instancia_vilao WHERE id=id_vilao);
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_mapa_vilao(id_vilao INTEGER)
    RETURNS INTEGER AS $$
BEGIN
  RETURN 
  (SELECT mapa FROM instancia_vilao WHERE id=id_vilao);
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE updade_vida_vilao(id_vilao INTEGER, _vida INTEGER)
AS $$
BEGIN
    UPDATE instancia_vilao SET vida = _vida WHERE id=id_vilao;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE updade_posicao_vilao(id_vilao INTEGER, lat INTEGER, longi INTEGER)
AS $$
BEGIN
    UPDATE instancia_vilao SET latitude = lat, longitude = longi WHERE id=id_vilao;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE updade_mapa_vilao(id_vilao INTEGER, _mapa INTEGER)
AS $$
BEGIN
    UPDATE instancia_vilao SET mapa = _mapa WHERE id=id_vilao;
END;
$$ LANGUAGE plpgsql;

-- HEROI

CREATE OR REPLACE FUNCTION get_vida_heroi(id_heroi INTEGER)
    RETURNS INTEGER AS $$
BEGIN
  RETURN 
  (SELECT vida FROM instancia_heroi WHERE id=id_heroi);
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_nome_heroi(id_heroi INTEGER)
    RETURNS INTEGER AS $$
BEGIN
  RETURN 
  (SELECT nome FROM instancia_heroi WHERE id=id_heroi);
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_type_heroi(id_heroi INTEGER)
    RETURNS INTEGER AS $$
BEGIN
  RETURN 
  (SELECT heroi FROM instancia_heroi WHERE id=id_heroi);
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_experiencia_heroi(id_heroi INTEGER)
    RETURNS INTEGER AS $$
BEGIN
  RETURN 
  (SELECT experiencia FROM instancia_heroi WHERE id=id_heroi);
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_traje_heroi(id_heroi INTEGER)
    RETURNS INTEGER AS $$
BEGIN
  RETURN 
  (SELECT traje FROM instancia_heroi WHERE id=id_heroi);
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_arma_heroi(id_heroi INTEGER)
    RETURNS INTEGER AS $$
BEGIN
  RETURN 
  (SELECT arma FROM instancia_heroi WHERE id=id_heroi);
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_latitude_heroi(id_heroi INTEGER)
    RETURNS INTEGER AS $$
BEGIN
  RETURN 
  (SELECT latitude FROM instancia_heroi WHERE id=id_heroi);
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_longitude_heroi(id_heroi INTEGER)
    RETURNS INTEGER AS $$
BEGIN
  RETURN 
  (SELECT longitude FROM instancia_heroi WHERE id=id_heroi);
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_mapa_heroi(id_heroi INTEGER)
    RETURNS INTEGER AS $$
BEGIN
  RETURN 
  (SELECT mapa FROM instancia_heroi WHERE id=id_heroi);
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE updade_vida_heroi(id_heroi INTEGER, _vida INTEGER)
AS $$
BEGIN
    UPDATE instancia_heroi SET vida = _vida WHERE id=id_heroi;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE updade_posicao_heroi(id_heroi INTEGER, lat INTEGER, longi INTEGER)
AS $$
BEGIN
    UPDATE instancia_heroi SET latitude = lat, longitude = longi WHERE id=id_heroi;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE updade_mapa_heroi(id_heroi INTEGER, _mapa INTEGER)
AS $$
BEGIN
    UPDATE instancia_heroi SET mapa = _mapa WHERE id=id_heroi;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_instancia_heroi(id_heroi INTEGER)
    RETURNS table (
    	nome TEXT,
    	heroi TEXT,
    	vida INTEGER,
    	experiencia INTEGER,
    	traje TEXT,
    	arma TEXT,
    	latitude INTEGER,
    	longitude INTEGER,
    	mapa INTEGER
    ) AS $$
begin
	
	return QUERY
		SELECT * FROM instancia_heroi WHERE id = id_heroi;
END
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION get_instancia_vilao(id_vilao INTEGER)
    RETURNS table (
    	vilao TEXT,
    	vida INTEGER,
    	latitude INTEGER,
    	longitude INTEGER,
    	mapa INTEGER
    ) AS $$
begin
	
	return QUERY
		SELECT * FROM instancia_vilao WHERE id = id_vilao;
END
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION get_instancia_item(id_item INTEGER)
    RETURNS table (
    	nome TEXT,
    	latitude INTEGER,
    	longitude INTEGER,
    	mapa INTEGER
    ) AS $$
begin
	
	return QUERY
		SELECT * FROM instancia_item WHERE id = id_item;
END
$$ LANGUAGE plpgsql;
