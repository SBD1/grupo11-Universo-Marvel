-- Herança de Item

-- INSERT e UPDATE
CREATE TRIGGER insert_arma_trigger
BEFORE INSERT OR UPDATE
ON arma
FOR EACH ROW
EXECUTE PROCEDURE insert_equipamento();

CREATE TRIGGER insert_traje_trigger
BEFORE INSERT OR UPDATE
ON traje
FOR EACH ROW
EXECUTE PROCEDURE insert_equipamento();

CREATE TRIGGER insert_consumivel_trigger
BEFORE INSERT OR UPDATE
ON consumivel
FOR EACH ROW
EXECUTE PROCEDURE insert_trocavel();

CREATE TRIGGER insert_joia_trigger
BEFORE INSERT OR UPDATE
ON joia
FOR EACH ROW
EXECUTE PROCEDURE insert_coletavel();

CREATE TRIGGER insert_moeda_trigger
BEFORE INSERT OR UPDATE
ON moeda
FOR EACH ROW
EXECUTE PROCEDURE insert_coletavel();

-- DELETE e UPDATE
CREATE TRIGGER delete_arma_trigger
AFTER DELETE OR UPDATE
ON arma
FOR EACH ROW
EXECUTE PROCEDURE delete_item();

CREATE TRIGGER delete_traje_trigger
AFTER DELETE OR UPDATE
ON traje
FOR EACH ROW
EXECUTE PROCEDURE delete_item();

CREATE TRIGGER delete_consumivel_trigger
AFTER DELETE OR UPDATE
ON consumivel
FOR EACH ROW
EXECUTE PROCEDURE delete_item();

CREATE TRIGGER delete_joia_trigger
AFTER DELETE OR UPDATE
ON joia
FOR EACH ROW
EXECUTE PROCEDURE delete_item();

CREATE TRIGGER delete_moeda_trigger
AFTER DELETE OR UPDATE
ON moeda
FOR EACH ROW
EXECUTE PROCEDURE delete_item();

CREATE TRIGGER delete_coletavel_trigger
AFTER DELETE OR UPDATE
ON joia
FOR EACH ROW
EXECUTE PROCEDURE delete_coletavel();

CREATE TRIGGER delete_equipamento_trigger
AFTER DELETE OR UPDATE
ON joia
FOR EACH ROW
EXECUTE PROCEDURE delete_equipamento();

-- Herança de Personagem

-- INSERT e UPDATE
CREATE TRIGGER insert_heroi_trigger
BEFORE INSERT OR UPDATE
ON heroi
FOR EACH ROW
EXECUTE PROCEDURE insert_personagem();

CREATE TRIGGER insert_vilao_trigger
BEFORE INSERT OR UPDATE
ON vilao
FOR EACH ROW
EXECUTE PROCEDURE insert_personagem();

-- DELETE e UPDATE
CREATE TRIGGER delete_heroi_trigger
AFTER DELETE OR UPDATE
ON heroi
FOR EACH ROW
EXECUTE PROCEDURE delete_personagem();

CREATE TRIGGER delete_vilao_trigger
AFTER DELETE OR UPDATE
ON vilao
FOR EACH ROW
EXECUTE PROCEDURE delete_personagem();
