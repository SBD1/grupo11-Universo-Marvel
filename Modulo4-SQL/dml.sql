INSERT INTO Efeito (Nome, Descricao) VALUES ('Fogo', 'Queima');



INSERT INTO Item (Tipo) 
VALUES ('M');

INSERT INTO Coletavel (Id, Tipo) 
VALUES (currval('item_id_seq'), 'M');

INSERT INTO Moeda (Id, Nome, Descricao)
VALUES (currval('item_id_seq'), 'Moeda', 'Pode ser trocada por items');



INSERT INTO Item (Tipo) 
VALUES ('C');

INSERT INTO Trocavel (Id, Tipo) 4
VALUES (currval('item_id_seq'), 'C');

INSERT INTO Consumivel (Id, Nome, Descricao, Quantidade_Maxima, Valor, Efeito, Grau, Duracao, Cooldown) 
VALUES (currval('item_id_seq'), 'Molotov', 'Coquetel incendiário', 10, 100, 'Fogo', 15, 5, 2);



INSERT INTO Item (Tipo) 
VALUES ('A');

INSERT INTO Trocavel (Id, Tipo) 
VALUES (currval('item_id_seq'), 'A');

INSERT INTO Equipamento (Id, Tipo) 
VALUES (currval('item_id_seq'), 'A');

INSERT INTO Arma (Id, Nome, Descricao, Quantidade_Maxima, Valor, Nivel_Minimo, Dano_Maximo, Dano_Critico, Rolagens)
VALUES (currval('item_id_seq'), 'Mjölnir', 'Martelo do Thor', 1, 1500, 1, 50, 150, 5);
