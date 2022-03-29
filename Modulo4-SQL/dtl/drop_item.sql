INSERT INTO instancia_heroi (nome, heroi, vida, latitude, longitude, mapa) VALUES
('Jogador', 'Thor', 1, 5, 5, 1);

INSERT INTO posse (heroi, item, quantidade) VALUES
('Jogador', 'Jóia do Tempo', 1);

-- Inicia uma transação entre o item no chão e o inventário do jogador
BEGIN;

INSERT INTO instancia_item(nome, latitude, longitude, mapa)
SELECT P.item, H.latitude, H.longitude, H.mapa
FROM instancia_heroi H, posse P
WHERE P.heroi = 'Jogador'
AND P.item = 'Jóia do Tempo'



COMMIT;