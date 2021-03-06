INSERT INTO joia (nome, descricao) VALUES
('Jóia da Mente', 'A Joia da Mente fornece acesso a todos os pensamentos e sonhos de qualquer ser. O seu portador ganha um portal para a consciência coletiva do universo inteiro.'),
('Jóia do Poder', 'A joia que dá acesso a todo o poder e energia que alguma vez existiu ou vai existir. O usuário que possuir essa joia se torna praticamente invencível, pois este objeto tem também a capacidade de fornecer energia ilimitada a qualquer máquina.'),
('Jóia do Espaço', 'Pense na Joia do Espaço como um portal instantâneo. O usuário desse objeto poderoso pode estar em qualquer lugar que desejar, podendo existir em vários lugares simultaneamente.'),
('Jóia da Alma', 'A Joia da Alma é frequentemente vista como a Joia da Mente elevada a um nível estratosférico. Quem possui a Joia da Alma tem a habilidade de roubar, manipular e alterar as almas dos vivos e dos mortos. Dentro desse artefato, encontram-se almas coletadas de diferentes seres, aprisionados em um limbo perpétuo.'),
('Jóia do Tempo', 'Imagine uma Joia capaz de transportar você para qualquer período histórico, seja no passado ou no futuro. A Joia do Tempo dá ao seu portador total domínio sobre a dimensão temporal, sendo capaz até de manipular os acontecimentos e alterar o rumo da história.'),
('Jóia da Realidade', 'As leis do universo físico podem ser quebradas ou eliminadas por meio da Joia da Realidade, pois ela torna qualquer desejo real. É a Joia do Infinito mais difícil de controlar e utilizar devido a seu poder vastíssimo, que pode sobrecarregar seu portador. A habilidade incrível de alterar a realidade de acordo com seus desejos faz dessa joia a mais perigosa de todas.');

INSERT INTO mapa (nome, ano, requisito, recompensa) VALUES
('Nova York', 2013, NULL, 'Jóia do Tempo'),
('Nova York', 2012, 'Jóia do Tempo', 'Jóia da Mente'),
('Asgard', 2013, 'Jóia da Mente', 'Jóia do Espaço'),
('Base da S.H.I.E.L.D.', 1970, 'Jóia do Espaço', 'Jóia da Realidade'),
('Vormir', 2014, 'Jóia da Realidade', 'Jóia da Alma'),
('Morag', 2014, 'Jóia da Alma', 'Jóia do Poder'),
('Terra', 2019, 'Jóia do Poder', NULL);

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
('Doutor Estranho', 58, 285),
('Hulk', 40, 795),
('Viúva Negra', 79, 75),
('Pantera Negra', 83, 65),
('Falcão', 76, 143),
('Homem-Formiga', 89, 75);

INSERT INTO vilao (nome, agilidade, vida, experiencia, dano_maximo, dano_critico, rolagens, defesa) VALUES
('Thanos', 65, 100, 50, 70, 90, 15, 65),
('Fauce de Ébano', 11, 62, 58, 79, 43, 12, 84),
('Corvus Glaive', 83, 72, 96, 57, 41, 9, 46),
('Próxima Meia-Noite', 15, 98, 77, 69, 92, 2, 33),
('Estrela Negra', 100, 22, 75, 31, 23, 11, 76),
('Supergigante', 44, 56, 81, 29, 39, 14, 67),
('Chitauris', 80, 42, 7, 98, 49, 6, 24),
('Outriders', 47, 77, 51, 74, 24, 18, 40),
('Nebulosa', 90, 44, 65, 25, 77, 4, 30),
('Hela', 88, 70, 55, 54, 77, 6, 54),
('Erik Killmonger', 67, 50, 25, 23, 5, 3, 34),
('Ego', 78, 73, 67, 47, 86, 6, 77),
('Homen Molecular', 33, 53, 32, 41, 23, 2, 21),
('Gorr', 63, 84, 43, 27, 45, 3, 53),
('Sakaarans', 81, 37, 89, 25, 82, 8, 40);

INSERT INTO arma (nome, descricao, quantidade_maxima, valor, nivel_minimo, dano_maximo, dano_critico, rolagens) VALUES
('Stormbreaker', 'Forjado pelos poderes de um deus e a energia uma estrela combinados, na forja de um anão gigante em Nidavellir.', 1, 30, 1, 57, 81, 12),
('Mjölnir', '"Quem quer que possua este martelo, se ele for digno, possuirá o poder de Thor." - Encanto de Mjölnir', 1, 48, 1, 54, 88, 12),
('Arco e Flecha', 'Arco e Flecha do Gavião arqueiro', 1, 11, 1, 55, 92, 5),
('Escudo de Vibranium', 'Um presente do pai do Tony Stark, este escudo consegue resistir a poderes de qualquer natureza e qualquer magnitude.', 1, 81, 1, 62, 98, 14),
('Manopla MK75', 'A última versão da manopla do Homem de Ferro.', 1, 28, 1, 53, 96, 10),
('Olho de Agamotto', 'Amuleto usado pelo Doutor Estranho', 1, 125, 1, 82, 96, 8),
('Lança Teias Comum', 'Lançador de teias básico do Homem-Aranha.', 1, 12, 1, 42, 67, 5),
('Garras de Vibranium', 'Garras feitas em Vibranium.', 1, 42, 1, 42, 77, 5),
('Default', 'Usado por personagens que normalmente não manuseiam armas.', 1, 1, 1, 20, 60, 10);

INSERT INTO traje (nome, descricao, quantidade_maxima, valor, nivel_minimo, defesa, agilidade) VALUES
('Armadura Hulkbuster', 'Armadura de grande porte.', 74, 42, 1, 46, 59),
('Capa da Levitação', 'Este traje concede a habilidade de voar.', 67, 83, 1, 76, 79),
('Traje América', 'Traje do Capitão América', 41, 46, 1, 25, 41),
('Armadura MK75', 'Esta armadura posui raios laser e uma IA que auxilia no controle e no voo.', 98, 37, 1, 45, 9),
('Capa Nórdica', 'Capa do Thor', 43, 56, 1, 12, 9),
('Traje Aranha', 'Esta armadura permite lançar teias e concede agilidade extrema ao usuário.', 21, 90, 1, 49, 68),
('Traje AntMan', 'Esta armadura permite maximizar o uso das partículas Pym, enquanto também proteger o utente dos efeitos colaterais negativos do uso de particulas.', 14, 50, 1, 67, 78),
('Armadura Falcão', 'Esta armadura desenvolvida em Wakanda, com habilidades de voar e enorme defesa com Vibranium.', 14, 55, 1, 87, 58),
('Traje Simples', 'Simples traje sem nenhuma peculiaridade.', 99, 1, 1, 5, 5),
('Traje Wakanda', 'Este traje feito de uma malha de microweave de vibranium. Isso significa que seu traje possui todas as propriedades do vibranium, incluindo quase invulnerabilidade devido à sua capacidade de absorver energia cinética e redistribuí-la conforme a vontade do usuário.', 99, 76, 1, 67, 86);

INSERT INTO acesso_equipamento (equipamento, heroi) VALUES
('Mjölnir', 'Thor'),
('Mjölnir', 'Capitão América'),
('Stormbreaker', 'Thor'),
('Escudo de Vibranium', 'Capitão América'),
('Manopla MK75', 'Homem de Ferro'),
('Olho de Agamotto', 'Doutor Estranho'),
('Lança Teias Comum', 'Homem-Aranha'),
('Garras de Vibranium', 'Pantera Negra'),
('Default', 'Hulk'),
('Default', 'Viúva Negra'),
('Default', 'Homem-Formiga'),
('Default', 'Falcão'),

('Traje América', 'Capitão América'),
('Capa Nórdica', 'Thor'),
('Armadura Hulkbuster', 'Homem de Ferro'),
('Capa da Levitação', 'Doutor Estranho'),
('Armadura MK75', 'Homem de Ferro'),
('Traje Aranha', 'Homem-Aranha'),
('Traje AntMan', 'Homem-Formiga'),
('Armadura Falcão', 'Falcão'),
('Traje Wakanda', 'Pantera Negra'),
('Traje Simples', 'Hulk'),
('Traje Simples', 'Viúva Negra');

INSERT INTO nivel (numero, experiencia_necessaria, escalonamento) VALUES 
(1, 0, 1),
(2, 100, 1.25),
(3, 200, 1.5),
(4, 400, 1.75),
(5, 800, 2),
(6, 1500, 2.25),
(7, 2600, 2.5),
(8, 4200, 2.75),
(9, 6400, 3),
(10, 9300, 3.25),
(11, 13000, 3.5),
(12, 17600, 3.75),
(13, 23200, 4),
(14, 29900, 4.25),
(15, 37800, 4.5),
(16, 47000, 4.75),
(17, 57600, 5),
(18, 69700, 5.25),
(19, 83400, 5.5),
(20, 98800, 5.75);

INSERT INTO moeda (nome, descricao) VALUES
('Moeda', 'Pode ser trocado por itens em uma base.');

INSERT INTO recompensa (item, vilao, quantidade) VALUES
('Moeda', 'Thanos', 298),
('Moeda', 'Fauce de Ébano', 138),
('Moeda', 'Corvus Glaive', 135),
('Moeda', 'Próxima Meia-Noite', 233),
('Moeda', 'Estrela Negra', 266),
('Moeda', 'Supergigante', 254),
('Moeda', 'Chitauris', 186),
('Moeda', 'Outriders', 273),
('Moeda', 'Sakaarans', 148),
('Moeda', 'Hela', 234),
('Moeda', 'Erik Killmonger', 75),
('Moeda', 'Ego', 342),
('Moeda', 'Homen Molecular', 34),
('Moeda', 'Nebulosa', 324),
('Moeda', 'Gorr', 453);

INSERT INTO efeito (nome) VALUES ('Vida');

INSERT INTO consumivel (nome, descricao, quantidade_maxima, valor, efeito, grau, duracao, cooldown) VALUES
('Cristal pequeno de cura', 'Cura vida de quem a usa.', 13, 40, 'Vida', 20, 0, 3),
('Cristal médio de cura', 'Cura vida de quem a usa.', 13, 100, 'Vida', 40, 0, 3),
('Cristal grande de cura', 'Cura vida de quem a usa.', 13, 150, 'Vida', 60, 0, 3),
('Cristal gigante de cura', 'Cura vida de quem a usa.', 3, 300, 'Vida', 100, 0, 2);

CALL popular_estoque();

CALL popular_mapas();
