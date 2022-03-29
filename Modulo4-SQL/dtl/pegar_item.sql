INSERT INTO instancia_item (nome, latitude, longitude, mapa) VALUES
('Jóia do Tempo', 5, 5, 1);

INSERT INTO instancia_item (nome, latitude, longitude, mapa) VALUES
('Moeda', 5, 5, 1);

INSERT INTO instancia_heroi (nome, heroi, vida, latitude, longitude, mapa) VALUES
('Jogador', 'Thor', 1, 5, 5, 1);

INSERT INTO posse (heroi, item, quantidade) VALUES
('Jogador', 'Moeda', 9);

-- Inicia uma transação entre o item no chão e o inventário do jogador
BEGIN;

-- Insere ou atualiza a posse na tabela
INSERT INTO posse (heroi, item, quantidade)
SELECT H.nome, I.nome, 1
FROM instancia_item I, instancia_heroi H
WHERE I.latitude = H.latitude
AND I.longitude = H.longitude
AND I.mapa = H.mapa
AND H.nome = 'Jogador'
ON CONFLICT (heroi, item) DO
UPDATE SET quantidade = posse.quantidade + 1;

-- Remove os itens coletados do chão
DELETE FROM instancia_item
WHERE EXISTS (
  SELECT I FROM instancia_item I, instancia_heroi H
  WHERE I.latitude = H.latitude
  AND I.longitude = H.longitude
  AND I.mapa = H.mapa
  AND H.nome = 'Jogador'
);

COMMIT;
