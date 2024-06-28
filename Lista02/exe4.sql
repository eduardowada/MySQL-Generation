CREATE DATABASE db_cidade_das_carnes;

USE db_cidade_das_carnes;

-- Criando a tabela tb_categorias
CREATE TABLE tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255) NOT NULL
);

-- Criando a tabela tb_produtos
CREATE TABLE tb_produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL(5,2) NOT NULL,
    peso_kg DECIMAL(5,2) NOT NULL,
    validade DATE NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

-- Inserindo registros na tabela tb_categorias
INSERT INTO tb_categorias (nome, descricao) VALUES
('Bovino', 'Carne de boi'),
('Suíno', 'Carne de porco'),
('Frango', 'Carne de frango'),
('Peixe', 'Peixes e frutos do mar'),
('Outros', 'Outros tipos de carne');

-- Inserindo registros na tabela tb_produtos
INSERT INTO tb_produtos (nome, preco, peso_kg, validade, id_categoria) VALUES
('Picanha', 120.00, 1.00, '2024-12-31', 1),
('Costela', 75.00, 1.50, '2024-11-30', 1),
('Filé Mignon', 150.00, 1.00, '2024-12-15', 1),
('Bacon', 80.00, 0.80, '2024-10-25', 2),
('Lombo de Porco', 60.00, 1.20, '2024-11-20', 2),
('Peito de Frango', 50.00, 1.00, '2024-09-15', 3),
('Salmão', 200.00, 1.00, '2024-08-30', 4),
('Camarão', 180.00, 1.00, '2024-07-25', 4);

-- SELECT que retorna todos os produtos cujo valor seja maior do que R$ 50,00
SELECT * FROM tb_produtos WHERE preco > 50.00;

-- SELECT que retorna todos os produtos cujo valor esteja no intervalo R$ 50,00 e R$ 150,00
SELECT * FROM tb_produtos WHERE preco BETWEEN 50.00 AND 150.00;

-- SELECT utilizando o operador LIKE, buscando todos os produtos que possuam a letra C no atributo nome
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

-- SELECT utilizando INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias
SELECT p.*, c.nome AS categoria_nome, c.descricao AS categoria_descricao
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id;

-- SELECT utilizando INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertencem a uma categoria específica (Exemplo: Todos os produtos que pertencem a categoria Peixe)
SELECT p.*, c.nome AS categoria_nome, c.descricao AS categoria_descricao
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id
WHERE c.nome = 'Peixe';
