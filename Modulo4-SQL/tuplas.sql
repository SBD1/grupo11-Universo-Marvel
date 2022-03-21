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
