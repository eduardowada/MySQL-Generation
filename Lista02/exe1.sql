CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;


CREATE TABLE tb_classes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255) NOT NULL
);

-- Criando a tabela tb_personagens
CREATE TABLE tb_personagens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    poder_ataque INT NOT NULL,
    poder_defesa INT NOT NULL,
    nivel INT NOT NULL,
    id_classe INT,
    FOREIGN KEY (id_classe) REFERENCES tb_classes(id)
);

-- Inserindo registros na tabela tb_classes
INSERT INTO tb_classes (nome, descricao) VALUES
('Guerreiro', 'Especialista em combate corpo a corpo'),
('Mago', 'Especialista em magia e ataques à distância'),
('Arqueiro', 'Especialista em ataques com arco e flecha'),
('Paladino', 'Guerreiro sagrado com habilidades de cura'),
('Assassino', 'Especialista em ataques rápidos e furtivos');

-- Inserindo registros na tabela tb_personagens
INSERT INTO tb_personagens (nome, poder_ataque, poder_defesa, nivel, id_classe) VALUES
('Arthas', 2500, 1500, 10, 1),
('Jaina', 2200, 1200, 12, 2),
('Legolas', 2100, 1000, 11, 3),
('Uther', 1800, 2000, 9, 4),
('Valeera', 2600, 800, 13, 5),
('Thrall', 2400, 1300, 10, 1),
('Sylvanas', 2300, 900, 12, 3),
('Kael\'thas', 2000, 1100, 11, 2);

-- SELECT que retorna todos os personagens cujo poder de ataque seja maior do que 2000
SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

-- SELECT que retorna todos os personagens cujo poder de defesa esteja no intervalo 1000 e 2000
SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

-- SELECT utilizando o operador LIKE, buscando todos os personagens que possuam a letra C no atributo nome
SELECT * FROM tb_personagens WHERE nome LIKE '%C%';

-- SELECT utilizando INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes
SELECT p.*, c.nome AS classe_nome, c.descricao AS classe_descricao
FROM tb_personagens p
INNER JOIN tb_classes c ON p.id_classe = c.id;

-- SELECT utilizando INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes, onde traga apenas os personagens da classe dos arqueiros
SELECT p.*, c.nome AS classe_nome, c.descricao AS classe_descricao
FROM tb_personagens p
INNER JOIN tb_classes c ON p.id_classe = c.id
WHERE c.nome = 'Arqueiro';
