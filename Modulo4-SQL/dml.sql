INSERT INTO Item (Tipo) VALUES
('J');
INSERT INTO Coletavel (Id, Tipo) VALUES
(currval('item_id_seq'), 'J');
INSERT INTO Joia (Id, Nome, Descricao) VALUES
(currval('item_id_seq'), 'Jóia do Tempo', 'Permite viagem a outras épocas.');

INSERT INTO Mapa (Nome, Ano, Altura, Largura, Requisito) VALUES
('Nova Iorque', 2022, 10, 5, NULL),
('Nova Iorque', 1984, 10, 5, currval('item_id_seq'),
('Nova Iorque', 1970, 10, 5, NULL),
('Eternos', 2022, 10, 5, NULL));

INSERT INTO Personagem (Tipo) VALUES
('H');
INSERT INTO Heroi (Id, Nome, AgilidadeBase, VidaBase, Latitude, Longitude, Mapa) VALUES
(currval('personagem_id_seq'), 'Homem-Aranha', 50, 100, 6, 2, 1);

INSERT INTO Personagem (Tipo) VALUES
('H');
INSERT INTO Heroi (Id, Nome, AgilidadeBase, VidaBase, Latitude, Longitude, Mapa) VALUES
(currval('personagem_id_seq'), 'Capitão América', 25, 150, 7, 3, 2);

INSERT INTO Personagem (Tipo) VALUES
('H');
INSERT INTO Heroi (Id, Nome, AgilidadeBase, VidaBase, Latitude, Longitude, Mapa) VALUES
(currval('personagem_id_seq'), 'Homem de Ferro', 25, 250, 8, 4, 3);

INSERT INTO Personagem (Tipo) VALUES
('V');
INSERT INTO Vilao (Id, Nome, Agilidade, Vida, Experiencia, Dano_Maximo, Dano_Critico, Rolagens, Defesa, Latitude, Longitude, Mapa) VALUES
(currval('personagem_id_seq'), 'Duende Verde', 35, 120, 200, 15, 200, 5, 15, 8, 3, 1);

INSERT INTO Personagem (Tipo) VALUES
('V');
INSERT INTO Vilao (Id, Nome, Agilidade, Vida, Experiencia, Dano_Maximo, Dano_Critico, Rolagens, Defesa, Latitude, Longitude, Mapa) VALUES
(currval('personagem_id_seq'), 'Thanos', 999, 999, 999, 999, 999, 99, 99, 1, 1, 4);
