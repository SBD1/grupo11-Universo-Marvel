INSERT INTO joia (nome, descricao) VALUES
('Jóia da Mente', 'A Joia da Mente fornece acesso a todos os pensamentos e sonhos de qualquer ser. O seu portador ganha um portal para a consciência coletiva do universo inteiro.'),
('Jóia do Poder', 'A joia que dá acesso a todo o poder e energia que alguma vez existiu ou vai existir. O usuário que possuir essa joia se torna praticamente invencível, pois este objeto tem também a capacidade de fornecer energia ilimitada a qualquer máquina.'),
('Jóia do Espaço', 'Pense na Joia do Espaço como um portal instantâneo. O usuário desse objeto poderoso pode estar em qualquer lugar que desejar, podendo existir em vários lugares simultaneamente.'),
('Jóia da Alma', 'A Joia da Alma é frequentemente vista como a Joia da Mente elevada a um nível estratosférico. Quem possui a Joia da Alma tem a habilidade de roubar, manipular e alterar as almas dos vivos e dos mortos. Dentro desse artefato, encontram-se almas coletadas de diferentes seres, aprisionados em um limbo perpétuo.'),
('Jóia do Tempo', 'Imagine uma Joia capaz de transportar você para qualquer período histórico, seja no passado ou no futuro. A Joia do Tempo dá ao seu portador total domínio sobre a dimensão temporal, sendo capaz até de manipular os acontecimentos e alterar o rumo da história.'),
('Jóia da Realidade', 'As leis do universo físico podem ser quebradas ou eliminadas por meio da Joia da Realidade, pois ela torna qualquer desejo real. É a Joia do Infinito mais difícil de controlar e utilizar devido a seu poder vastíssimo, que pode sobrecarregar seu portador. A habilidade incrível de alterar a realidade de acordo com seus desejos faz dessa joia a mais perigosa de todas.');

INSERT INTO mapa (nome, ano, requisito) VALUES
('Asgard', 2013, 'Jóia da Mente'),
('Nova York', 2013, NULL),
('Nova York', 2012, 'Jóia do Tempo'),
('Base da S.H.I.E.L.D.', 1970, 'Jóia do Espaço'),
('Vormir', 2014, 'Jóia da Realidade'),
('Morag', 2014, 'Jóia da Alma'),
('Terra', 2019, 'Jóia do Poder');

INSERT INTO base (latitude, longitude, mapa) VALUES
(15, 15, 1),
(12, 18, 2),
(8, 17, 3),
(11, 15, 4),
(10, 12, 5),
(0, 6, 6),
(15, 1, 7);

INSERT INTO heroi (nome, agilidade, vida) VALUES
('Homem de Ferro', 51, 156),
('Capitão América', 86, 154),
('Thor', 74, 250),
('Homem-Aranha', 100, 150),
('Doutor Estranho', 58, 285);

INSERT INTO vilao (nome, agilidade, vida, experiencia, dano_maximo, dano_critico, rolagens, defesa) VALUES
('Thanos', 65, 100, 50, 70, 90, 15, 65),
('Fauce de Ébano', 11, 62, 58, 79, 43, 12, 84),
('Corvus Glaive', 83, 72, 96, 57, 41, 9, 46),
('Próxima Meia-Noite', 15, 98, 77, 69, 92, 2, 33),
('Estrela Negra', 100, 22, 75, 31, 23, 11, 76),
('Supergigante', 44, 56, 81, 29, 39, 14, 67),
('Chitauris', 80, 42, 7, 98, 49, 6, 24),
('Outriders', 47, 77, 51, 74, 24, 18, 40),
('Sakaarans', 81, 37, 89, 25, 82, 8, 40);

INSERT INTO instancia_vilao(vilao, latitude, longitude, mapa) VALUES
('Sakaarans', 18, 1, 1),
('Outriders', 4, 7, 1),
('Thanos', 1, 7, 2),
('Estrela Negra', 1, 4, 7),
('Sakaarans', 3, 3, 2),
('Chitauris', 8, 19, 6),
('Fauce de Ébano', 11, 4, 7),
('Supergigante', 13, 3, 5),
('Corvus Glaive', 18, 16, 7),
('Supergigante', 12, 14, 5),
('Estrela Negra', 16, 18, 6),
('Outriders', 18, 17, 5),
('Sakaarans', 17, 3, 4),
('Chitauris', 16, 16, 6),
('Outriders', 7, 14, 1),
('Estrela Negra', 6, 3, 4),
('Outriders', 10, 8, 4),
('Sakaarans', 11, 3, 1),
('Próxima Meia-Noite', 9, 14, 4),
('Outriders', 2, 11, 3),
('Próxima Meia-Noite', 6, 9, 4),
('Outriders', 2, 17, 6),
('Estrela Negra', 12, 14, 2),
('Supergigante', 10, 19, 6),
('Corvus Glaive', 11, 1, 4),
('Corvus Glaive', 8, 9, 1),
('Outriders', 7, 3, 7),
('Chitauris', 2, 4, 1),
('Corvus Glaive', 16, 4, 2),
('Próxima Meia-Noite', 12, 15, 7),
('Corvus Glaive', 9, 2, 6),
('Supergigante', 3, 2, 7),
('Chitauris', 1, 8, 6),
('Estrela Negra', 8, 10, 4),
('Próxima Meia-Noite', 12, 15, 7),
('Outriders', 6, 4, 7),
('Chitauris', 7, 10, 4),
('Corvus Glaive', 13, 3, 2),
('Supergigante', 18, 5, 3),
('Sakaarans', 3, 11, 1),
('Corvus Glaive', 19, 2, 5),
('Estrela Negra', 16, 8, 3),
('Sakaarans', 13, 5, 2),
('Supergigante', 2, 0, 5),
('Supergigante', 18, 11, 1),
('Próxima Meia-Noite', 17, 19, 6),
('Corvus Glaive', 5, 5, 1),
('Chitauris', 9, 19, 4),
('Próxima Meia-Noite', 18, 8, 2),
('Chitauris', 14, 16, 6);

INSERT INTO arma (nome, descricao, quantidade_maxima, valor, nivel_minimo, dano_maximo, dano_critico, rolagens) VALUES
('Stormbreaker', 'Forjado pelos poderes de um deus e a energia uma estrela combinados, na forja de um anão gigante em Nidavellir.', 1, 30, 1, 57, 81, 12),
('Mjölnir', '"Quem quer que possua este martelo, se ele for digno, possuirá o poder de Thor." - Encanto de Mjölnir', 1, 48, 1, 54, 88, 12),
('Arco e Flecha', 'Arco e Flecha do Gavião arqueiro', 1, 11, 1, 55, 92, 5),
('Escudo de Vibranium', 'Um presente do pai do Tony Stark, este escudo consegue resistir a poderes de qualquer natureza e qualquer magnitude.', 1, 81, 1, 62, 98, 14),
('Manopla MK75', 'A última versão da manopla do Homem de Ferro.', 1, 28, 1, 53, 96, 10),
('Olho de Agamotto', 'Amuleto usado pelo Doutor Estranho', 1, 125, 1, 82, 96, 8),
('Lança Teias Comum', 'Lançador de teias básico do Homem-Aranha.', 1, 12, 1, 42, 67, 5);

INSERT INTO traje (nome, descricao, quantidade_maxima, valor, nivel_minimo, defesa, agilidade) VALUES
('Armadura Hulkbuster', 'Armadura de grande porte.', 74, 42, 57, 46, 59),
('Capa da Levitação', 'Este traje concede a habilidade de voar.', 67, 83, 77, 76, 79),
('Traje de Pantera', 'Este traje concede agilidade extrema ao usuário.', 41, 46, 17, 25, 41),
('Armadura MK75', 'Esta armadura posui raios laser e uma IA que auxilia no controle e no voo.', 98, 37, 84, 45, 9),
('Traje Quântico', 'Este traje permite que o usuário mude seu tamanho, podendo chegar do tamanho de um átomo até prédio de 20 andares.', 43, 56, 52, 12, 9),
('Traje Aranha', 'Esta armadura permite lançar teias e concede agilidade extrema ao usuário.', 21, 90, 80, 49, 68);

INSERT INTO acesso_equipamento (equipamento, heroi) VALUES
('Mjölnir', 'Thor'),
('Mjölnir', 'Capitão América'),
('Stormbreaker', 'Thor'),
('Arco e Flecha', 'Gavião Arqueiro'),
('Escudo de Vibranium', 'Capitão América'),
('Manopla MK75', 'Homem de Ferro'),
('Manopla MK75', 'Máquina de Combate'),
('Olho de Agamotto', 'Doutor Estranho'),
('Lança Teias Comum', 'Homem-Aranha'),

('Armadura Hulkbuster', 'Homem de Ferro'),
('Armadura Hulkbuster', 'Máquina de Combate'),
('Capa da Levitação', 'Doutor Estranho'),
('Armadura MK75', 'Homem de Ferro'),
('Armadura MK75', 'Máquina de Combate'),
('Traje Aranha', 'Homem-Aranha');
