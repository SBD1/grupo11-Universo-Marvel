-- Criando e Conectando ao Banco de Dados
DROP DATABASE IF EXISTS sbd_marvel;

CREATE DATABASE sbd_marvel;

\connect sbd_marvel;

-- Criando Domínios

CREATE DOMAIN POSITIVE_INT INTEGER CHECK (VALUE > 0);
CREATE DOMAIN NON_NEGATIVE_INT INTEGER CHECK (VALUE >= 0);

CREATE DOMAIN POSITIVE_REAL REAL CHECK (VALUE > 0);
CREATE DOMAIN NON_NEGATIVE_REAL REAL CHECK (VALUE >= 0);

CREATE DOMAIN COORDINATE INTEGER CHECK (VALUE >= 0 AND VALUE < 20);

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
  nivel_minimo POSITIVE_INT NOT NULL DEFAULT 1,
  dano_maximo POSITIVE_INT NOT NULL,
  dano_critico POSITIVE_INT NOT NULL,
  rolagens POSITIVE_INT NOT NULL
);

CREATE TABLE base (
  id SERIAL PRIMARY KEY,
  latitude COORDINATE NOT NULL,
  longitude COORDINATE NOT NULL,
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
  id SERIAL UNIQUE NOT NULL,
  nome TEXT PRIMARY KEY,
  heroi TEXT NOT NULL,
  vida NON_NEGATIVE_INT NOT NULL,
  experiencia NON_NEGATIVE_INT NOT NULL DEFAULT 0,
  traje TEXT, 
  arma TEXT, 
  latitude COORDINATE NOT NULL,
  longitude COORDINATE NOT NULL,
  mapa INTEGER NOT NULL
);

CREATE TABLE instancia_item (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  quantidade POSITIVE_INT NOT NULL DEFAULT 1,
  latitude COORDINATE NOT NULL,
  longitude COORDINATE NOT NULL,
  mapa INTEGER NOT NULL
);

CREATE TABLE instancia_vilao (
  id SERIAL PRIMARY KEY,
  vilao TEXT NOT NULL,
  vida NON_NEGATIVE_INT NOT NULL DEFAULT 0,
  latitude COORDINATE NOT NULL,
  longitude COORDINATE NOT NULL,
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
  descricao TEXT NOT NULL,
  quantidade_maxima POSITIVE_INT NOT NULL DEFAULT 1
);

CREATE TABLE mapa (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  ano NON_NEGATIVE_INT NOT NULL,
  requisito TEXT,
  recompensa TEXT,

  UNIQUE (nome, ano)
);

CREATE TABLE moeda (
  nome TEXT PRIMARY KEY,
  descricao TEXT NOT NULL,

  CHECK (nome = 'Moeda')
);

CREATE TABLE nivel (
  numero SERIAL PRIMARY KEY,
  experiencia_necessaria NON_NEGATIVE_INT NOT NULL,
  escalonamento POSITIVE_REAL NOT NULL
);

CREATE TABLE personagem (
  nome TEXT PRIMARY KEY,
  tipo CHAR,

  CHECK (tipo IN ('H', 'V'))
);

CREATE TABLE posse (
  item TEXT NOT NULL,
  heroi TEXT NOT NULL,
  quantidade POSITIVE_INT NOT NULL DEFAULT 1,

  PRIMARY KEY (item, heroi)
);

CREATE TABLE recompensa (
  item TEXT NOT NULL,
  vilao TEXT NOT NULL,
  quantidade POSITIVE_INT NOT NULL
);

CREATE TABLE traje (
  nome TEXT PRIMARY KEY,
  descricao TEXT NOT NULL,
  quantidade_maxima POSITIVE_INT,
  valor POSITIVE_INT NOT NULL,
  nivel_minimo POSITIVE_INT NOT NULL DEFAULT 1,
  defesa POSITIVE_INT NOT NULL,
  agilidade POSITIVE_INT NOT NULL
);

CREATE TABLE troca (
  id SERIAL PRIMARY KEY,
  item TEXT NOT NULL,
  heroi TEXT NOT NULL,
  base INTEGER NOT NULL,
  quantidade_item POSITIVE_INT NOT NULL,
  venda_ou_compra CHAR NOT NULL,

  CHECK (venda_ou_compra in ('V', 'C'))
);

CREATE TABLE trocavel (
  nome TEXT PRIMARY KEY,
  tipo CHAR NOT NULL,

  CHECK (tipo IN ('T', 'A', 'C'))
);

CREATE TABLE vilao (
  nome TEXT PRIMARY KEY,
  agilidade POSITIVE_INT NOT NULL,
  vida NON_NEGATIVE_INT NOT NULL,
  experiencia POSITIVE_INT NOT NULL,
  dano_maximo POSITIVE_INT NOT NULL,
  dano_critico POSITIVE_INT NOT NULL,
  rolagens POSITIVE_INT NOT NULL,
  defesa POSITIVE_INT NOT NULL
);

-- Adicionando Chaves Estrangeiras

ALTER TABLE acesso_equipamento ADD FOREIGN KEY (equipamento) REFERENCES equipamento (nome);
ALTER TABLE acesso_equipamento ADD FOREIGN KEY (heroi) REFERENCES heroi (nome);

ALTER TABLE arma ADD FOREIGN KEY (nome) REFERENCES equipamento (nome);

ALTER TABLE base ADD FOREIGN KEY (mapa) REFERENCES mapa (id);

ALTER TABLE coletavel ADD FOREIGN KEY (nome) REFERENCES item (nome);

ALTER TABLE consumivel ADD FOREIGN KEY (nome) REFERENCES trocavel (nome);
ALTER TABLE consumivel ADD FOREIGN KEY (efeito) REFERENCES efeito (nome);

ALTER TABLE consumo ADD FOREIGN KEY (heroi) REFERENCES instancia_heroi (nome);
ALTER TABLE consumo ADD FOREIGN KEY (consumivel) REFERENCES consumivel (nome);

ALTER TABLE efeito_arma ADD FOREIGN KEY (arma) REFERENCES arma (nome);
ALTER TABLE efeito_arma ADD FOREIGN KEY (efeito) REFERENCES efeito (nome);

ALTER TABLE efeito_vilao ADD FOREIGN KEY (vilao) REFERENCES vilao (nome);
ALTER TABLE efeito_vilao ADD FOREIGN KEY (efeito) REFERENCES efeito (nome);

ALTER TABLE equipamento ADD FOREIGN KEY (nome) REFERENCES trocavel (nome);

ALTER TABLE estoque ADD FOREIGN KEY (base) REFERENCES base (id);
ALTER TABLE estoque ADD FOREIGN KEY (item) REFERENCES item (nome);

ALTER TABLE heroi ADD FOREIGN KEY (nome) REFERENCES personagem (nome);

ALTER TABLE imunidade_traje ADD FOREIGN KEY (traje) REFERENCES traje (nome);
ALTER TABLE imunidade_traje ADD FOREIGN KEY (efeito) REFERENCES efeito (nome);

ALTER TABLE imunidade_vilao ADD FOREIGN KEY (vilao) REFERENCES vilao (nome);
ALTER TABLE imunidade_vilao ADD FOREIGN KEY (efeito) REFERENCES efeito (nome);
  
ALTER TABLE instancia_heroi ADD FOREIGN KEY (heroi) REFERENCES heroi (nome);
ALTER TABLE instancia_heroi ADD FOREIGN KEY (traje) REFERENCES traje (nome);
ALTER TABLE instancia_heroi ADD FOREIGN KEY (arma) REFERENCES arma (nome);
ALTER TABLE instancia_heroi ADD FOREIGN KEY (mapa) REFERENCES mapa (id);

ALTER TABLE instancia_item ADD FOREIGN KEY (nome) REFERENCES item (nome);

ALTER TABLE instancia_vilao ADD FOREIGN KEY (vilao) REFERENCES vilao (nome);
ALTER TABLE instancia_vilao ADD FOREIGN KEY (mapa) REFERENCES mapa (id);

ALTER TABLE mapa ADD FOREIGN KEY (requisito) REFERENCES joia (nome);
ALTER TABLE mapa ADD FOREIGN KEY (recompensa) REFERENCES joia (nome);

ALTER TABLE moeda ADD FOREIGN KEY (nome) REFERENCES coletavel (nome);

ALTER TABLE posse ADD FOREIGN KEY (heroi) REFERENCES instancia_heroi (nome);
ALTER TABLE posse ADD FOREIGN KEY (item) REFERENCES item (nome);

ALTER TABLE recompensa ADD FOREIGN KEY (item) REFERENCES item (nome);
ALTER TABLE recompensa ADD FOREIGN KEY (vilao) REFERENCES vilao (nome);

ALTER TABLE traje ADD FOREIGN KEY (nome) REFERENCES equipamento (nome);

ALTER TABLE troca ADD FOREIGN KEY (heroi) REFERENCES instancia_heroi (nome);
ALTER TABLE troca ADD FOREIGN KEY (item) REFERENCES item (nome);
ALTER TABLE troca ADD FOREIGN KEY (base) REFERENCES base (id);

ALTER TABLE trocavel ADD FOREIGN KEY (nome) REFERENCES item (nome);

-- Criando Funções

CREATE OR REPLACE PROCEDURE reviver_viloes(mapa_vilao INTEGER)
LANGUAGE PLPGSQL
AS $reviver_viloes$
DECLARE vilao_morto RECORD;
DECLARE vida_maxima INTEGER;
BEGIN
  FOR vilao_morto IN (SELECT * FROM instancia_vilao WHERE mapa = mapa_vilao) LOOP
    SELECT vida INTO vida_maxima FROM vilao WHERE nome = vilao_morto.vilao;
    UPDATE instancia_vilao SET vida = vida_maxima WHERE mapa = mapa_vilao;
  END LOOP;
END;
$reviver_viloes$;

CREATE OR REPLACE PROCEDURE derrotar_vilao(id_heroi INTEGER, id_vilao INTEGER)
LANGUAGE PLPGSQL
AS $derrotar_vilao$
DECLARE item_recompensa RECORD;
DECLARE nome_vilao TEXT;
DECLARE lat_vilao INTEGER;
DECLARE lon_vilao INTEGER;
DECLARE mapa_vilao INTEGER;
DECLARE exp_vilao INTEGER;
DECLARE viloes_vivos INTEGER;
DECLARE recompensa_mapa TEXT;
DECLARE nome_heroi TEXT;
BEGIN
  SELECT vilao, latitude, longitude, mapa
  INTO nome_vilao, lat_vilao, lon_vilao, mapa_vilao
  FROM instancia_vilao
  WHERE id = id_vilao;

  FOR item_recompensa IN (SELECT item, quantidade FROM recompensa WHERE vilao = nome_vilao) LOOP
    INSERT INTO instancia_item (nome, quantidade,  latitude, longitude, mapa) VALUES
    (item_recompensa.item, item_recompensa.quantidade, lat_vilao, lon_vilao, mapa_vilao);
  END LOOP;

  SELECT experiencia INTO exp_vilao FROM vilao WHERE nome = nome_vilao;

  UPDATE instancia_heroi
  SET experiencia = experiencia + exp_vilao
  WHERE id = id_heroi;

  SELECT COUNT(*) INTO viloes_vivos FROM instancia_vilao WHERE mapa = mapa_vilao AND vida > 0;

  IF viloes_vivos = 0 THEN
    SELECT recompensa INTO recompensa_mapa FROM mapa where id = mapa_vilao;
    IF recompensa_mapa IS NOT NULL THEN
      SELECT nome INTO nome_heroi FROM instancia_heroi WHERE id = id_heroi;
      IF recompensa_mapa NOT IN (SELECT item FROM posse WHERE heroi = nome_heroi) THEN
        INSERT INTO posse (item, heroi) VALUES (recompensa_mapa, nome_heroi);
      END IF;
    END IF;
  END IF;
END;
$derrotar_vilao$;

CREATE TYPE ataque_resultado AS (
  dano_causado INTEGER,
  vida_restante INTEGER
);

CREATE OR REPLACE FUNCTION atacar_vilao(id_heroi INTEGER, id_vilao INTEGER)
RETURNS ataque_resultado
LANGUAGE PLPGSQL
AS $atacar_vilao$
DECLARE vida_vilao INTEGER;
DECLARE dano_maximo_arma INTEGER;
DECLARE dano_critico_arma INTEGER;
DECLARE rolagens_arma INTEGER;
DECLARE rolagem INTEGER;
DECLARE dano_causado INTEGER;
DECLARE vida_restante INTEGER;
DECLARE resultado ataque_resultado;
BEGIN
  SELECT dano_maximo, dano_critico, rolagens
  INTO dano_maximo_arma, dano_critico_arma, rolagens_arma
  FROM arma
  WHERE nome IN (
    SELECT arma
    FROM instancia_heroi
    WHERE id = id_heroi
  );

  SELECT * INTO rolagem FROM CEIL(RANDOM() * (rolagens_arma - 1));
  rolagem := rolagem + 1;

  IF rolagem = rolagens_arma THEN
    dano_causado := dano_critico_arma;
  ELSE
    SELECT * INTO dano_causado FROM CEIL((CAST(rolagem AS DECIMAL) / rolagens_arma) * dano_maximo_arma);
  END IF;

  SELECT vida INTO vida_vilao FROM instancia_vilao WHERE id = id_vilao;

  SELECT * INTO vida_restante FROM GREATEST(0, vida_vilao - dano_causado);
  
  UPDATE instancia_vilao
  SET vida = vida_restante
  WHERE id = id_vilao;

  IF vida_restante = 0 THEN
    CALL derrotar_vilao(id_heroi, id_vilao);
  END IF;

  resultado.dano_causado = dano_causado;
  resultado.vida_restante = vida_restante;

  RETURN resultado;
END;
$atacar_vilao$;

CREATE OR REPLACE PROCEDURE derrotar_heroi(id_vilao INTEGER, id_heroi INTEGER)
LANGUAGE PLPGSQL
AS $derrotar_heroi$
DECLARE nome_heroi TEXT;
DECLARE mapa_heroi INTEGER;
DECLARE lat_base INTEGER;
DECLARE lon_base INTEGER;
DECLARE vida_maxima INTEGER;
BEGIN
  SELECT heroi, mapa
  INTO nome_heroi, mapa_heroi
  FROM instancia_heroi
  WHERE id = id_heroi;

  SELECT latitude, longitude INTO lat_base, lon_base FROM base WHERE mapa = mapa_heroi;

  SELECT vida INTO vida_maxima FROM heroi WHERE nome = nome_heroi;

  UPDATE instancia_heroi
  SET latitude = lat_base, longitude = lon_base, vida = vida_maxima
  WHERE id = id_heroi;
END;
$derrotar_heroi$;

CREATE OR REPLACE FUNCTION atacar_heroi(id_vilao INTEGER, id_heroi INTEGER)
RETURNS ataque_resultado
LANGUAGE PLPGSQL
AS $atacar_heroi$
DECLARE vida_heroi INTEGER;
DECLARE nome_vilao TEXT;
DECLARE dano_maximo_vilao INTEGER;
DECLARE dano_critico_vilao INTEGER;
DECLARE rolagens_vilao INTEGER;
DECLARE rolagem INTEGER;
DECLARE dano_causado INTEGER;
DECLARE vida_restante INTEGER;
DECLARE resultado ataque_resultado;
BEGIN
  SELECT vilao
  INTO nome_vilao
  FROM instancia_vilao
  WHERE id = id_vilao;

  SELECT dano_maximo, dano_critico, rolagens
  INTO dano_maximo_vilao, dano_critico_vilao, rolagens_vilao
  FROM vilao
  WHERE nome = nome_vilao;

  SELECT * INTO rolagem FROM CEIL(RANDOM() * (rolagens_vilao - 1));
  rolagem := rolagem + 1;

  IF rolagem = rolagens_vilao THEN
    dano_causado := dano_critico_vilao;
  ELSE
    SELECT * INTO dano_causado FROM CEIL((CAST(rolagem AS DECIMAL) / rolagens_vilao) * dano_maximo_vilao);
  END IF;

  SELECT vida INTO vida_heroi FROM instancia_heroi WHERE id = id_heroi;

  SELECT * INTO vida_restante FROM GREATEST(0, vida_heroi - dano_causado);

  UPDATE instancia_heroi
  SET vida = vida_restante
  WHERE id = id_heroi;

  IF vida_restante = 0 THEN
    CALL derrotar_heroi(id_vilao, id_heroi);
  END IF;

  resultado.dano_causado = dano_causado;
  resultado.vida_restante = vida_restante;

  RETURN resultado;
END;
$atacar_heroi$;

CREATE OR REPLACE FUNCTION consumir_item(nome_heroi TEXT, nome_item TEXT)
RETURNS INTEGER
LANGUAGE PLPGSQL
AS $consumir_item$
DECLARE qtd_item INTEGER;
DECLARE efeito_item TEXT;
DECLARE grau_item INTEGER;
DECLARE vida_atual INTEGER;
DECLARE heroi_instancia TEXT;
DECLARE vida_maxima INTEGER;
DECLARE vida_final INTEGER;
BEGIN
  SELECT quantidade
  INTO qtd_item
  FROM posse
  WHERE item = nome_item
  AND heroi = nome_heroi;

  IF qtd_item = 1 THEN
    DELETE FROM posse
    WHERE item = nome_item
    AND heroi = nome_heroi;
  ELSE
    UPDATE posse
    SET quantidade = quantidade - 1
    WHERE item = nome_item
    AND heroi = nome_heroi;
  END IF;

  SELECT efeito, grau
  INTO efeito_item, grau_item
  FROM consumivel
  WHERE nome = nome_item;

  SELECT vida INTO vida_final FROM instancia_heroi WHERE nome = nome_heroi;

  IF efeito_item = 'Vida' THEN
    SELECT vida, heroi
    INTO vida_atual, heroi_instancia
    FROM instancia_heroi
    WHERE nome = nome_heroi;

    SELECT vida
    INTO vida_maxima
    FROM heroi
    WHERE nome = heroi_instancia;

    SELECT * INTO vida_final FROM LEAST(vida_atual + grau_item, vida_maxima);

    UPDATE instancia_heroi
    SET vida = vida_final
    WHERE nome = nome_heroi;
  END IF;

  RETURN vida_final;
END;
$consumir_item$;

CREATE OR REPLACE PROCEDURE criar_instancia_heroi(save_nome TEXT, save_heroi TEXT)
LANGUAGE PLPGSQL
AS $criar_instancia_heroi$
DECLARE save_vida INTEGER;
DECLARE save_mapa INTEGER;
DECLARE save_lat INTEGER;
DECLARE save_lon INTEGER;
DECLARE save_arma TEXT;
DECLARE save_traje TEXT;
BEGIN
  SELECT vida
  INTO save_vida
  FROM heroi
  WHERE nome = save_heroi;

  SELECT id
  INTO save_mapa
  FROM mapa
  WHERE requisito IS NULL;

  SELECT latitude, longitude
  INTO save_lat, save_lon
  FROM base
  WHERE mapa = save_mapa;

  SELECT nome
  INTO save_arma
  FROM arma 
  WHERE nivel_minimo = 1
  AND nome IN (
    SELECT equipamento
    FROM acesso_equipamento
    WHERE heroi = save_heroi
  )
  LIMIT 1;

  SELECT nome
  INTO save_traje
  FROM traje 
  WHERE nivel_minimo = 1
  AND nome IN (
    SELECT equipamento
    FROM acesso_equipamento
    WHERE heroi = save_heroi
  )
  LIMIT 1;


  INSERT INTO instancia_heroi (nome, heroi, vida, latitude, longitude, mapa, traje, arma) VALUES
  (save_nome, save_heroi, save_vida, save_lat, save_lon, save_mapa, save_traje, save_arma);
END;
$criar_instancia_heroi$;

CREATE OR REPLACE FUNCTION get_instancias_heroi()
RETURNS TABLE (
  id INTEGER,
  nome TEXT,
  heroi TEXT,
  vida NON_NEGATIVE_INT,
  experiencia NON_NEGATIVE_INT,
  traje TEXT, 
  arma TEXT, 
  latitude COORDINATE,
  longitude COORDINATE,
  mapa INTEGER,
  agilidade POSITIVE_INT,
  vida_maxima POSITIVE_INT
)
LANGUAGE PLPGSQL
AS $get_instancias_heroi$
BEGIN
  RETURN QUERY
  SELECT I.*, H.agilidade, H.vida
  FROM instancia_heroi I, heroi H
  WHERE I.heroi = H.nome;
END;
$get_instancias_heroi$;

CREATE OR REPLACE FUNCTION get_instancias_vilao()
RETURNS TABLE(
  id INTEGER,
  vilao TEXT,
  vida NON_NEGATIVE_INT,
  latitude COORDINATE,
  longitude COORDINATE,
  mapa INTEGER,
  agilidade POSITIVE_INT,
  vida_maxima NON_NEGATIVE_INT,
  experiencia POSITIVE_INT,
  dano_maximo POSITIVE_INT,
  dano_critico POSITIVE_INT,
  rolagens POSITIVE_INT,
  defesa POSITIVE_INT
)
LANGUAGE PLPGSQL
AS $get_instancias_vilao$
BEGIN
  RETURN QUERY
  SELECT I.*, V.agilidade, V.vida, V.experiencia, V.dano_maximo, V.dano_critico, V.rolagens, V.defesa
  FROM instancia_vilao I, vilao V
  WHERE I.vilao = V.nome;
END;
$get_instancias_vilao$;

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

CREATE OR REPLACE FUNCTION mover_heroi(nome_heroi TEXT, direcao CHAR)
RETURNS TABLE (nova_latitude COORDINATE, nova_longitude COORDINATE)
LANGUAGE PLPGSQL
AS $mover_heroi$
BEGIN
  IF direcao = 'W' THEN 
    UPDATE instancia_heroi SET latitude = latitude - 1 WHERE nome = nome_heroi;
  ELSIF direcao = 'A' THEN
    UPDATE instancia_heroi SET longitude = longitude - 1 WHERE nome = nome_heroi;
  ELSIF direcao = 'S' THEN
    UPDATE instancia_heroi SET latitude = latitude + 1 WHERE nome = nome_heroi;
  ELSIF direcao = 'D' THEN
    UPDATE instancia_heroi SET longitude = longitude + 1 WHERE nome = nome_heroi;
  END IF;

  RETURN QUERY
  SELECT latitude, longitude
  FROM instancia_heroi
  WHERE nome = nome_heroi;
EXCEPTION WHEN SQLSTATE '23000' THEN
END;
$mover_heroi$;

CREATE OR REPLACE FUNCTION set_vida_vilao()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $set_vida_vilao$
DECLARE vida_instancia INTEGER;
BEGIN
  SELECT vida INTO vida_instancia FROM vilao WHERE nome = NEW.vilao;
  UPDATE instancia_vilao SET vida = vida_instancia WHERE id = NEW.id;
  RETURN NEW;
END;
$set_vida_vilao$;

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

CREATE OR REPLACE FUNCTION get_quantidade_maxima(nome_item TEXT)
RETURNS INTEGER
LANGUAGE PLPGSQL
AS $get_quantidade_maxima$
DECLARE tipo_item CHAR;
DECLARE qtd_max_item INTEGER;
BEGIN
  SELECT tipo INTO tipo_item FROM item WHERE nome = nome_item;

  
  IF tipo_item = 'T' THEN
    SELECT quantidade_maxima INTO qtd_max_item FROM traje WHERE nome = nome_item;
  ELSIF tipo_item = 'A' THEN
    SELECT quantidade_maxima INTO qtd_max_item FROM arma WHERE nome = nome_item;
  ELSIF tipo_item = 'C' THEN
    SELECT quantidade_maxima INTO qtd_max_item FROM consumivel WHERE nome = nome_item;
  ELSIF tipo_item = 'J' THEN
    qtd_max_item := 1;
  ELSIF tipo_item = 'M' THEN
    qtd_max_item := 2147483647;
  END IF;

  RETURN qtd_max_item;
END;
$get_quantidade_maxima$;

CREATE OR REPLACE PROCEDURE pegar_itens(nome_heroi TEXT)
LANGUAGE PLPGSQL
AS $pegar_itens$
DECLARE item_chao RECORD;
DECLARE lat_heroi INTEGER;
DECLARE lon_heroi INTEGER;
DECLARE mapa_heroi INTEGER;
DECLARE qtd_maxima_item INTEGER;
DECLARE qtd_inventario INTEGER;
DECLARE qtd_total INTEGER;
DECLARE qtd_pega INTEGER;
DECLARE qtd_restante INTEGER;
DECLARE item_no_inventario INTEGER;
BEGIN
  SELECT latitude, longitude, mapa
  INTO lat_heroi, lon_heroi, mapa_heroi
  FROM instancia_heroi
  WHERE nome = nome_heroi;

  FOR item_chao IN (
    SELECT *
    FROM instancia_item
    WHERE latitude = lat_heroi
    AND longitude = lon_heroi
    AND mapa = mapa_heroi
  ) LOOP
    SELECT * INTO qtd_maxima_item FROM get_quantidade_maxima(item_chao.nome);

    SELECT COUNT(*) INTO item_no_inventario FROM posse WHERE heroi=nome_heroi AND ITEM = item_chao.nome;

    SELECT quantidade INTO qtd_inventario FROM posse WHERE heroi = nome_heroi AND ITEM = item_chao.nome;

    IF item_no_inventario = 0 THEN
      qtd_total := item_chao.quantidade;
    ELSE
      qtd_total := item_chao.quantidade + qtd_inventario;
    END IF;

    SELECT * INTO qtd_pega FROM LEAST(qtd_total, qtd_maxima_item);

    qtd_restante := qtd_total - qtd_pega;

    IF item_no_inventario = 0 THEN
      INSERT INTO posse (heroi, item, quantidade) VALUES (nome_heroi, item_chao.nome, qtd_pega);
    ELSE
      UPDATE posse SET quantidade = qtd_pega WHERE heroi = nome_heroi AND ITEM = item_chao.nome;
    END IF;
    
    IF qtd_restante = 0 THEN
      DELETE FROM instancia_item WHERE id = item_chao.id;
    ELSE
      UPDATE instancia_item SET quantidade = qtd_restante WHERE id = item_chao.id;
    END IF;
  END LOOP;
END;
$pegar_itens$;

CREATE OR REPLACE FUNCTION get_mapas(nome_heroi TEXT)
RETURNS SETOF mapa
LANGUAGE PLPGSQL
AS $get_mapas$
BEGIN
  RETURN QUERY
  SELECT *
  FROM mapa
  WHERE (
      requisito IN (
      SELECT nome
      FROM joia
      WHERE nome IN (
        SELECT item FROM posse WHERE heroi = nome_heroi
      )
    )
    OR requisito IS NULL
  )
  AND id NOT IN (
    SELECT mapa
    FROM instancia_heroi
    WHERE nome = nome_heroi
  );
END;
$get_mapas$;

CREATE TYPE coordenada AS(
  latitude INTEGER,
  longitude INTEGER,
  mapa INTEGER
);

CREATE OR REPLACE FUNCTION ir_para_mapa(nome_heroi TEXT, nome_mapa TEXT, ano_mapa INTEGER)
RETURNS coordenada
LANGUAGE PLPGSQL
AS $ir_para_mapa$
DECLARE id_mapa INTEGER;
DECLARE lat_base INTEGER;
DECLARE lon_base INTEGER;
DECLARE resultado coordenada;
BEGIN
  SELECT id INTO id_mapa FROM mapa where nome = nome_mapa AND ano = ano_mapa;
  SELECT latitude, longitude INTO lat_base, lon_base FROM base WHERE mapa = id_mapa;
  UPDATE instancia_heroi
  SET latitude = lat_base, longitude = lon_base, mapa = id_mapa
  WHERE nome = nome_heroi;

  resultado.latitude = lat_base;
  resultado.longitude = lon_base;
  resultado.mapa = id_mapa;

  RETURN resultado;
END;
$ir_para_mapa$;

CREATE OR REPLACE FUNCTION get_trocaveis(nome_heroi TEXT)
RETURNS TABLE (
  nome_item TEXT,
  qtd_item POSITIVE_INT
)
LANGUAGE PLPGSQL
AS $get_trocaveis$
BEGIN
  RETURN QUERY
  SELECT item, quantidade
  FROM posse
  WHERE heroi = nome_heroi
  AND item IN (
    SELECT nome
    FROM trocavel
  );
END;
$get_trocaveis$;

CREATE OR REPLACE FUNCTION get_preco(nome_item TEXT)
RETURNS INTEGER
LANGUAGE PLPGSQL
AS $get_preco$
DECLARE tipo_item CHAR;
DECLARE preco_item INTEGER;
BEGIN
  SELECT tipo INTO tipo_item FROM item WHERE nome = nome_item;

  IF tipo_item = 'T' THEN
    SELECT valor INTO preco_item FROM traje WHERE nome = nome_item;
  ELSIF tipo_item = 'A' THEN
    SELECT valor INTO preco_item FROM arma WHERE nome = nome_item;
  ELSIF tipo_item = 'C' THEN
    SELECT valor INTO preco_item FROM consumivel WHERE nome = nome_item;
  END IF;

  RETURN preco_item;
END;
$get_preco$;

CREATE OR REPLACE PROCEDURE vender_item(nome_heroi TEXT, nome_item TEXT, qtd INTEGER)
LANGUAGE PLPGSQL
AS $vender_item$
DECLARE qtd_inventario INTEGER;
DECLARE qtd_vendida INTEGER;
DECLARE id_base INTEGER;
DECLARE em_estoque INTEGER;
DECLARE custo_item INTEGER;
BEGIN
  SELECT quantidade
  INTO qtd_inventario
  FROM posse
  WHERE heroi = nome_heroi
  AND item = nome_item;

  SELECT id INTO id_base
  FROM base
  WHERE (latitude, longitude, mapa) IN (
    SELECT latitude, longitude, mapa
    FROM instancia_heroi
    WHERE nome = nome_heroi
  );

  SELECT * INTO custo_item FROM get_preco(nome_item);

  SELECT * INTO qtd_vendida FROM LEAST(qtd_inventario, qtd);

  UPDATE posse
  SET quantidade = quantidade + (custo_item * qtd_vendida)
  WHERE heroi = nome_heroi
  AND item = 'Moeda';

  SELECT COUNT(*) INTO em_estoque FROM estoque WHERE item = nome_item AND base = id_base;

  IF em_estoque = 0 THEN
    INSERT INTO estoque (base, item, quantidade) VALUES
    (id_base, nome_item, qtd_vendida);
  ELSE
    UPDATE estoque
    SET quantidade = quantidade + qtd_vendida
    WHERE item = nome_item
    AND base = id_base;
  END IF;

  IF qtd_vendida = qtd_inventario THEN
    DELETE FROM posse WHERE item = nome_item AND heroi = nome_heroi;
  ELSE
    UPDATE posse
    SET quantidade = quantidade - qtd_vendida
    WHERE item = nome_item
    AND heroi = nome_heroi;
  END IF;
END;
$vender_item$;

CREATE OR REPLACE PROCEDURE comprar_item(nome_heroi TEXT, nome_item TEXT, qtd INTEGER)
LANGUAGE PLPGSQL
AS $comprar_item$
DECLARE id_base INTEGER;
DECLARE moedas_heroi INTEGER;
DECLARE custo_item INTEGER;
DECLARE qtd_compravel INTEGER;
DECLARE qtd_estoque INTEGER;
DECLARE qtd_comprada INTEGER;
DECLARE no_inventario INTEGER;
BEGIN
  SELECT id
  INTO id_base
  FROM base
  WHERE (latitude, longitude, mapa) IN (
    SELECT latitude, longitude, mapa
    FROM instancia_heroi
    WHERE nome = nome_heroi
  );

  SELECT quantidade
  INTO moedas_heroi
  FROM posse
  WHERE heroi = nome_heroi
  AND item = 'Moeda';

  SELECT * INTO custo_item FROM get_preco(nome_item);

  qtd_compravel := moedas_heroi / custo_item;

  SELECT quantidade
  INTO qtd_estoque
  FROM estoque
  WHERE base = id_base
  AND item = nome_item;

  SELECT * INTO qtd_comprada FROM LEAST(qtd_compravel, qtd_estoque, qtd);

  IF qtd_comprada = 0 THEN
    RETURN;
  END IF;

  IF qtd_comprada = qtd_estoque THEN
    DELETE FROM estoque WHERE base = id_base AND item = nome_item;
  ELSE
    UPDATE estoque
    SET quantidade = quantidade - qtd_comprada
    WHERE base = id_base
    AND item = nome_item;
  END IF;

  UPDATE posse
  SET quantidade = quantidade - (qtd_comprada * custo_item)
  WHERE heroi = nome_heroi
  AND item = 'Moeda';

  SELECT COUNT(*)
  INTO no_inventario
  FROM posse
  WHERE heroi = nome_heroi
  AND item = nome_item;

  IF no_inventario = 0 THEN
    INSERT INTO posse (heroi, item, quantidade) VALUES
    (nome_heroi, nome_item, qtd_comprada);
  ELSE
    UPDATE posse
    SET quantidade = quantidade + qtd_comprada
    WHERE heroi = nome_heroi
    AND item = nome_item;
  END IF;
END;
$comprar_item$;

CREATE OR REPLACE FUNCTION get_estoque(nome_heroi TEXT)
RETURNS SETOF estoque
LANGUAGE PLPGSQL
AS $get_estoque$
DECLARE id_base INTEGER;
BEGIN
  SELECT id
  INTO id_base
  FROM base
  WHERE (latitude, longitude, mapa) IN (
    SELECT latitude, longitude, mapa
    FROM instancia_heroi
    WHERE nome = nome_heroi
  );

  RETURN QUERY
  SELECT *
  FROM estoque
  WHERE base = id_base;
END;
$get_estoque$;

CREATE OR REPLACE PROCEDURE desequipar_item(nome_heroi TEXT, tipo_item CHAR)
LANGUAGE PLPGSQL
AS $desequipar_item$
DECLARE nome_item TEXT;
DECLARE no_inventario INTEGER;
BEGIN
  IF tipo_item = 'A' THEN
    SELECT arma INTO nome_item FROM instancia_heroi WHERE nome = nome_heroi;
    UPDATE instancia_heroi SET arma = NULL WHERE nome = nome_heroi;
  ELSIF tipo_item = 'T' THEN
    SELECT traje INTO nome_item FROM instancia_heroi WHERE nome = nome_heroi;
    UPDATE instancia_heroi SET traje = NULL WHERE nome = nome_heroi;
  ELSE
    RETURN;
  END IF;

  IF nome_item IS NULL THEN
    RETURN;
  END IF;

  SELECT COUNT(*)
  INTO no_inventario
  FROM posse
  WHERE item = nome_item
  AND heroi = nome_heroi;

  IF no_inventario = 0 THEN
    INSERT INTO posse (heroi, item, quantidade) VALUES
    (nome_heroi, nome_item, 1);
  ELSE
    UPDATE posse
    SET quantidade = quantidade + 1
    WHERE heroi = nome_heroi
    AND item = nome_item;
  END IF;
END;
$desequipar_item$;

CREATE OR REPLACE FUNCTION get_nivel_minimo(nome_item TEXT)
RETURNS INTEGER
LANGUAGE PLPGSQL
AS $get_nivel_minimo$
DECLARE tipo_item CHAR;
DECLARE nivel_min_item INTEGER;
BEGIN
  SELECT tipo INTO tipo_item FROM item WHERE nome = nome_item;

  IF tipo_item = 'T' THEN
    SELECT nivel_minimo INTO nivel_min_item FROM traje WHERE nome = nome_item;
  ELSIF tipo_item = 'A' THEN
    SELECT nivel_minimo INTO nivel_min_item FROM arma WHERE nome = nome_item;
  END IF;

  RETURN nivel_min_item;
END;
$get_nivel_minimo$;

CREATE TYPE novo_equipamento AS (
  nome_equipamento TEXT,
  tipo_equipamento CHAR
);

CREATE OR REPLACE FUNCTION equipar_item(nome_heroi TEXT, nome_item TEXT)
RETURNS novo_equipamento
LANGUAGE PLPGSQL
AS $equipar_item$
DECLARE tipo_item CHAR;
DECLARE qtd_item INTEGER;
DECLARE exp_heroi INTEGER;
DECLARE nivel_heroi INTEGER;
DECLARE nivel_minimo_item INTEGER;
DECLARE resultado novo_equipamento;
BEGIN
  SELECT experiencia INTO exp_heroi FROM instancia_heroi WHERE nome = nome_heroi;

  SELECT numero
  INTO nivel_heroi
  FROM nivel
  WHERE experiencia_necessaria <= exp_heroi
  ORDER BY numero DESC
  LIMIT 1;

  SELECT * INTO nivel_minimo_item FROM get_nivel_minimo(nome_item);

  SELECT tipo INTO tipo_item FROM item WHERE nome = nome_item;

  IF nivel_minimo_item > nivel_heroi THEN
    resultado.nome_equipamento = NULL;
    resultado.tipo_equipamento = NULL;
    RETURN resultado;
  END IF;

  CALL desequipar_item(nome_heroi, tipo_item);

  SELECT quantidade
  INTO qtd_item
  FROM posse
  WHERE heroi = nome_heroi
  AND item = nome_item;

  IF qtd_item = 1 THEN
    DELETE FROM posse WHERE item = nome_item AND heroi = nome_heroi;
  ELSE
    UPDATE posse
    SET quantidade = quantidade - 1
    WHERE item = nome_item
    AND heroi = nome_heroi;
  END IF;

  IF tipo_item = 'A' THEN
    UPDATE instancia_heroi
    SET arma = nome_item
    WHERE nome = nome_heroi;
  ELSE
    UPDATE instancia_heroi
    SET traje = nome_item
    WHERE nome = nome_heroi;
  END IF;

  resultado.nome_equipamento = nome_item;
  resultado.tipo_equipamento = tipo_item;

  RETURN resultado;
END;
$equipar_item$;

CREATE OR REPLACE PROCEDURE soltar_item(nome_heroi TEXT, nome_item TEXT, qtd INTEGER)
LANGUAGE PLPGSQL
AS $soltar_item$
DECLARE qtd_inventario INTEGER;
DECLARE qtd_solta INTEGER;
DECLARE lat_heroi INTEGER;
DECLARE lon_heroi INTEGER;
DECLARE mapa_heroi INTEGER;
BEGIN
  SELECT quantidade
  INTO qtd_inventario
  FROM posse
  WHERE heroi = nome_heroi
  AND item = nome_item;

  SELECT * INTO qtd_solta FROM LEAST(qtd_inventario, qtd);

  IF qtd_solta = qtd_inventario THEN
    DELETE FROM posse WHERE heroi = nome_heroi AND item = nome_item;
  ELSE
    UPDATE posse
    SET quantidade = quantidade - qtd_solta
    WHERE heroi = nome_heroi
    AND item = nome_item;
  END IF;

  SELECT latitude, longitude, mapa
  INTO lat_heroi, lon_heroi, mapa_heroi
  FROM instancia_heroi
  WHERE nome = nome_heroi;

  INSERT INTO instancia_item (nome, quantidade, latitude, longitude, mapa) VALUES
  (nome_item, qtd_solta, lat_heroi, lon_heroi, mapa_heroi);
END;
$soltar_item$;

-- Criando Triggers

CREATE TRIGGER criar_instancia_vilao_trigger
AFTER INSERT
ON instancia_vilao
FOR EACH ROW
EXECUTE PROCEDURE set_vida_vilao();

CREATE TRIGGER insert_joia_trigger
BEFORE INSERT
ON joia
FOR EACH ROW
EXECUTE PROCEDURE insert_coletavel();

CREATE TRIGGER insert_heroi_trigger
BEFORE INSERT
ON heroi
FOR EACH ROW
EXECUTE PROCEDURE insert_personagem();

CREATE TRIGGER insert_vilao_trigger
BEFORE INSERT
ON vilao
FOR EACH ROW
EXECUTE PROCEDURE insert_personagem();

CREATE TRIGGER insert_arma_trigger
BEFORE INSERT
ON arma
FOR EACH ROW
EXECUTE PROCEDURE insert_equipamento();

CREATE TRIGGER insert_traje_trigger
BEFORE INSERT
ON traje
FOR EACH ROW
EXECUTE PROCEDURE insert_equipamento();

CREATE TRIGGER insert_consumivel_trigger
BEFORE INSERT
ON consumivel
FOR EACH ROW
EXECUTE PROCEDURE insert_trocavel();

CREATE TRIGGER insert_moeda_trigger
BEFORE INSERT
ON moeda
FOR EACH ROW
EXECUTE PROCEDURE insert_coletavel();
