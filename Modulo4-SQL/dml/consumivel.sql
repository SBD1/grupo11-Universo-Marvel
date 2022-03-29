INSERT INTO item (nome, tipo) VALUES
('Poção pequena de cura', 'C'),
('Poção média de cura', 'C'),
('Poção grande de cura', 'C'),
('Poção gigante de cura', 'C'),
('Poção pequena de agilidade', 'C'),
('Poção média de agilidade', 'C'),
('Poção grande de agilidade', 'C'),
('Poção gigante de agilidade', 'C'),
('Poção pequena de magia', 'C'),
('Poção média de magia', 'C'),
('Poção grande de magia', 'C'),
('Poção gigante de magia', 'C'),
('Poção de invisibilidade', 'C');

INSERT INTO trocavel (nome, tipo) VALUES
('Poção pequena de cura', 'C'),
('Poção média de cura', 'C'),
('Poção grande de cura', 'C'),
('Poção gigante de cura', 'C'),
('Poção pequena de agilidade', 'C'),
('Poção média de agilidade', 'C'),
('Poção grande de agilidade', 'C'),
('Poção gigante de agilidade', 'C'),
('Poção pequena de magia', 'C'),
('Poção média de magia', 'C'),
('Poção grande de magia', 'C'),
('Poção gigante de magia', 'C'),
('Poção de invisibilidade', 'C');

INSERT INTO consumivel (nome, descricao, quantidade_maxima, valor, efeito, grau, duracao, cooldown) VALUES
('Poção pequena de cura', 'Cura vida de quem a usa.', 13, 40, 'Vida', 20, 0, 3),
('Poção média de cura', 'Cura vida de quem a usa.', 13, 100, 'Vida', 40, 0, 3),
('Poção grande de cura', 'Cura vida de quem a usa.', 13, 150, 'Vida', 60, 0, 3),
('Poção gigante de cura', 'Cura vida de quem a usa.', 3, 300, 'Vida', 100, 0, 2),
('Poção pequena de agilidade', 'Aumenta a agilidade temporariamente.', 13, 40, 'Agilidade', 20, 0, 3),
('Poção média de agilidade', 'Aumenta a agilidade temporariamente.', 13, 100, 'Agilidade', 40, 0, 3),
('Poção grande de agilidade', 'Aumenta a agilidade temporariamente.', 13, 150, 'Agilidade', 60, 0, 3),
('Poção gigante de agilidade', 'Aumenta a agilidade temporariamente.', 3, 300, 'Agilidade', 100, 0, 2),
('Poção pequena de magia', 'Confere dano mágico temporariamente.', 13, 40, 'Magia', 20, 0, 3),
('Poção média de magia', 'Confere dano mágico temporariamente.', 13, 100, 'Magia', 40, 0, 3),
('Poção grande de magia', 'Confere dano mágico temporariamente.', 13, 150, 'Magia', 60, 0, 3),
('Poção gigante de magia', 'Confere dano mágico temporariamente.', 3, 300, 'Magia', 100, 0, 2),
('Poção de invisibilidade', 'Permite fuga fácil.', 1, 500, 'Invisibilidade', 1, 0, 0);
