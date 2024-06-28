CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

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
    marca VARCHAR(50) NOT NULL,
    validade DATE NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

-- Inserindo registros na tabela tb_categorias
INSERT INTO tb_categorias (nome, descricao) VALUES
('Medicamentos', 'Produtos destinados ao tratamento de doenças'),
('Cosméticos', 'Produtos de beleza e cuidados pessoais'),
('Suplementos', 'Produtos para suplementação alimentar'),
('Higiene', 'Produtos para higiene pessoal'),
('Infantil', 'Produtos destinados ao público infantil');

-- Inserindo registros na tabela tb_produtos
INSERT INTO tb_produtos (nome, preco, marca, validade, id_categoria) VALUES
('Paracetamol', 10.00, 'Medley', '2025-12-31', 1),
('Shampoo Anticaspa', 25.00, 'Head & Shoulders', '2024-06-30', 2),
('Vitamina C', 15.00, 'Sundown', '2026-05-15', 3),
('Pasta de Dente', 8.00, 'Colgate', '2024-12-31', 4),
('Fralda Infantil', 45.00, 'Pampers', '2025-08-20', 5),
('Ibuprofeno', 12.00, 'Bayer', '2025-11-30', 1),
('Creme Hidratante', 35.00, 'Nivea', '2024-10-31', 2),
('Ômega 3', 55.00, 'Sundown', '2026-03-10', 3);

-- SELECT que retorna todos os produtos cujo valor seja maior do que R$ 50,00
SELECT * FROM tb_produtos WHERE preco > 50.00;

-- SELECT que retorna todos os produtos cujo valor esteja no intervalo R$ 5,00 e R$ 60,00
SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 60.00;

-- SELECT utilizando o operador LIKE, buscando todos os produtos que possuam a letra C no atributo nome
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

-- SELECT utilizando INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias
SELECT p.*, c.nome AS categoria_nome, c.descricao AS categoria_descricao
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id;

-- SELECT utilizando INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertencem a uma categoria específica (Exemplo: Todos os produtos que pertencem a categoria cosméticos)
SELECT p.*, c.nome AS categoria_nome, c.descricao AS categoria_descricao
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id
WHERE c.nome = 'Cosméticos';
