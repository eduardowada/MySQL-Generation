CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

-- Criando a tabela tb_categorias
CREATE TABLE tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255) NOT NULL
);

-- Criando a tabela tb_pizzas
CREATE TABLE tb_pizzas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL(5,2) NOT NULL,
    tamanho VARCHAR(20) NOT NULL,
    ingredientes VARCHAR(255) NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

-- Inserindo registros na tabela tb_categorias
INSERT INTO tb_categorias (nome, descricao) VALUES
('Tradicional', 'Pizzas clássicas com sabores tradicionais'),
('Especial', 'Pizzas com ingredientes especiais e receitas exclusivas'),
('Vegetariana', 'Pizzas sem ingredientes de origem animal'),
('Doce', 'Pizzas com sabores doces para sobremesa'),
('Premium', 'Pizzas com ingredientes premium e de alta qualidade');

-- Inserindo registros na tabela tb_pizzas
INSERT INTO tb_pizzas (nome, preco, tamanho, ingredientes, id_categoria) VALUES
('Margherita', 42.00, 'Média', 'Mussarela, Tomate, Manjericão', 1),
('Pepperoni', 55.00, 'Grande', 'Mussarela, Pepperoni', 2),
('Quatro Queijos', 60.00, 'Grande', 'Mussarela, Gorgonzola, Parmesão, Provolone', 2),
('Vegana', 48.00, 'Média', 'Mussarela Vegana, Tomate, Rúcula', 3),
('Chocolate', 35.00, 'Pequena', 'Chocolate, Morango', 4),
('Frango com Catupiry', 65.00, 'Grande', 'Frango, Catupiry, Mussarela', 5),
('Calabresa', 50.00, 'Média', 'Calabresa, Cebola, Mussarela', 1),
('Portuguesa', 58.00, 'Grande', 'Mussarela, Presunto, Ovo, Cebola, Azeitona', 2);

-- SELECT que retorna todas as pizzas cujo valor seja maior do que R$ 45,00
SELECT * FROM tb_pizzas WHERE preco > 45.00;

-- SELECT que retorna todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00
SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00;

-- SELECT utilizando o operador LIKE, buscando todas as pizzas que possuam a letra M no atributo nome
SELECT * FROM tb_pizzas WHERE nome LIKE '%M%';

-- SELECT utilizando INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias
SELECT p.*, c.nome AS categoria_nome, c.descricao AS categoria_descricao
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = c.id;

-- SELECT utilizando INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias, onde traga apenas as pizzas que pertençam a uma categoria específica (Exemplo: Todas as pizzas que são doce)
SELECT p.*, c.nome AS categoria_nome, c.descricao AS categoria_descricao
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = c.id
WHERE c.nome = 'Doce';
