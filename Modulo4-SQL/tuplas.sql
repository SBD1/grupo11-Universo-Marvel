INSERT INTO acesso_equipamento (equipamento, heroi) VALUES
('arma', 'Rosana Eckh'),
('arma', 'Gusti Eberz'),
('traje', 'Marabel Linkin'),
('arma', 'Buckie Tomanek'),
('arma', 'Stevy Link'),
('traje', 'Betteanne Butterick'),
('traje', 'Christoforo Blackster'),
('traje', 'Halley Knutsen'),
('traje', 'Fredia Tapping'),
('traje', 'Dallon Temblett'),
('traje', 'Wang Kayes'),
('traje', 'Sean Goutcher'),
('traje', 'Meredith Wiffill'),
('arma', 'Yancy Boc'),
('traje', 'Pauli Asel'),
('arma', 'Janifer Povey'),
('traje', 'Padraic Whittington'),
('arma', 'Wesley Dewsbury'),
('arma', 'Martie Stretton'),
('arma', 'Dick Ensley');

INSERT INTO arma (nome, descricao, quantidade_maxima, valor, nivel_minimo, dano_maximo, dano_critico, rolagens) VALUES ('Tammy Reichardt', 'duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer', 11, 30, 86, 57, 81, 12),
('Tamara Mummery', 'mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis', 5, 48, 49, 11, 88, 12),
('Ali Wroughton', 'in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum', 41, 11, 74, 55, 92, 5),
('Hurleigh Presser', 'fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat', 17, 81, 42, 98, 25, 14),
('Sherline Preddy', 'accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a', 43, 28, 35, 96, 23, 10),
('Gordy Parram', 'ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices', 42, 86, 73, 65, 83, 6),
('Kristin D''Elias', 'bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis', 44, 28, 32, 10, 23, 3),
('Liza Fould', 'lacus purus aliquet at feugiat non pretium quis lectus suspendisse', 39, 24, 76, 1, 37, 2),
('Annnora Eivers', 'penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean', 44, 75, 90, 6, 53, 7),
('Benedict Worley', 'libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas', 5, 92, 60, 98, 69, 4),
('Lillis Drogan', 'magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere', 23, 26, 2, 33, 75, 12),
('Fleur Soanes', 'ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit', 48, 73, 95, 31, 10, 10),
('Merilee Blanking', 'ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti', 31, 34, 14, 33, 22, 10),
('Del Deerr', 'auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit', 24, 15, 79, 14, 7, 1),
('Tabbi Wolsey', 'odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer', 45, 21, 99, 10, 100, 6),
('Ginny Johannesson', 'vitae mattis nibh ligula nec sem duis aliquam convallis nunc', 47, 58, 100, 36, 12, 10),
('Myrlene O''Cannovane', 'sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis', 44, 8, 65, 39, 13, 1),
('Prentice Moral', 'porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque', 40, 22, 37, 89, 89, 10),
('Paulie Langrish', 'ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl', 21, 66, 17, 52, 27, 12),
('Darci Assinder', 'tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis', 22, 58, 36, 40, 37, 12);

INSERT INTO heroi (nome, agilidade, vida) VALUES
('Denys Lind', 64, 5),
('Aubine Mcimmie', 34, 25),
('Sholom Vynarde', 93, 96),
('Jed Verman', 4, 49),
('Verene Acklands', 45, 13),
('Tannie Stamper', 29, 65),
('Holt Fawks', 67, 34),
('Tamra Clarricoates', 91, 56),
('Merridie Girling', 21, 73),
('Brnaba Longhorne', 96, 51),
('Sultana Baldomar', 22, 71),
('Stephan Tögöldör', 45, 61),
('Sebastianus Garth', 23, 21);

INSERT INTO mapa (id, nome, ano) VALUES
(1, 'Indonesia', 1998),
(2, 'China', 2004),
(3, 'China', 1984),
(4, 'China', 2008),
(5, 'Mauritius', 2012),
(6, 'China', 2013),
(7, 'Indonesia', 2007),
(8, 'New Zealand', 2002),
(9, 'Canada', 2006),
(10, 'Philippines', 1993),
(11, 'Thailand', 1991),
(12, 'Japan', 2050),
(13, 'South Africa', 1402);

INSERT INTO espaco (latitude, longitude, mapa) VALUES
(13, 70, 8),
(27, 74, 7),
(78, 88, 6),
(13, 83, 7),
(55, 96, 4),
(72, 55, 4),
(7, 41, 8),
(81, 13, 6),
(27, 91, 6),
(53, 97, 7),
(35, 53, 11),
(67, 6, 12),
(55, 54, 13);

INSERT INTO instancia_heroi (heroi, vida, latitude, longitude, mapa) VALUES
('Tannie Stamper', 54, 13, 70, 8),
('Denys Lind', 7, 27, 74, 7),
('Brnaba Longhorne', 83, 78, 88, 6),
('Tamra Clarricoates', 17, 13, 83, 7),
('Jed Verman', 75, 55, 96, 4),
('Tamra Clarricoates', 21, 72, 55, 4),
('Tannie Stamper', 42, 7, 41, 8),
('Denys Lind', 70, 81, 13, 6),
('Holt Fawks', 39, 27, 91, 6),
('Brnaba Longhorne', 29, 76, 85, 7),
('Sultana Baldomar', 34, 45, 7, 11),
('Stephan Tögöldör', 53, 58, 97, 12),
('Sebastianus Garth', 12, 8, 75, 13);


INSERT INTO imunidade_traje (traje, efeito) VALUES (),
INSERT INTO coletavel (nome, tipo) VALUES ()
INSERT INTO consumivel ( nome, descricao, quantidade_maxima,valor, efeito, grau, duracao, cooldown) VALUES ()
INSERT INTO consumo ( heroi, consumivel, vezes) VALUES ()
INSERT INTO efeito ( nome ) VALUES ()
INSERT INTO efeito_arma ( arma, efeito) VALUES ()
INSERT INTO trocavel ( nome, tipo ) VALUES ()