CREATE DATABASE db_construindo_vidas;

USE db_construindo_vidas;

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
    preco DECIMAL(7,2) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    quantidade INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

-- Inserindo registros na tabela tb_categorias
INSERT INTO tb_categorias (nome, descricao) VALUES
('Ferramentas', 'Ferramentas manuais e elétricas'),
('Materiais de Construção', 'Tijolos, cimentos, areias e afins'),
('Hidráulica', 'Canos, conexões e outros itens hidráulicos'),
('Elétrica', 'Fios, lâmpadas e outros itens elétricos'),
('Tintas e Acessórios', 'Tintas, pincéis e outros acessórios de pintura');

-- Inserindo registros na tabela tb_produtos
INSERT INTO tb_produtos (nome, preco, marca, quantidade, id_categoria) VALUES
('Martelo', 120.00, 'Tramontina', 50, 1),
('Parafusadeira', 200.00, 'Bosch', 30, 1),
('Saco de Cimento', 30.00, 'Votoran', 100, 2),
('Canos de PVC', 70.00, 'Tigre', 200, 3),
('Fios Elétricos', 150.00, 'Sil', 500, 4),
('Lâmpada LED', 20.00, 'Philips', 300, 4),
('Tinta Acrílica', 90.00, 'Suvinil', 80, 5),
('Pincel', 15.00, 'Atlas', 150, 5);

-- SELECT que retorna todos os produtos cujo valor seja maior do que R$ 100,00
SELECT * FROM tb_produtos WHERE preco > 100.00;

-- SELECT que retorna todos os produtos cujo valor esteja no intervalo R$ 70,00 e R$ 150,00
SELECT * FROM tb_produtos WHERE preco BETWEEN 70.00 AND 150.00;

-- SELECT utilizando o operador LIKE, buscando todos os produtos que possuam a letra C no atributo nome
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

-- SELECT utilizando INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias
SELECT p.*, c.nome AS categoria_nome, c.descricao AS categoria_descricao
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id;

-- SELECT utilizando INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertencem a uma categoria específica (Exemplo: Todos os produtos que pertencem a categoria hidráulica)
SELECT p.*, c.nome AS categoria_nome, c.descricao AS categoria_descricao
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id
WHERE c.nome = 'Hidráulica';
