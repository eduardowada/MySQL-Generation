CREATE DATABASE db_ecommerce;

USE db_ecommerce;

CREATE TABLE tb_produtos(
	id BIGINT auto_increment,
    nome VARCHAR(150),
    descricao VARCHAR(255),
    preco DECIMAL(8,2),
    categoria VARCHAR(100),
    PRIMARY KEY (id)
);

INSERT INTO tb_produtos(nome, descricao, preco, categoria)
VALUES ("Protetor solar", "Protege dos raios solares", 49.90, "Saúde"),
("Notebook Dell Inspiron 15", "Notebook potente para uso diário", 5000.00, "Eletrônicos"),
("Arroz Bão Dimais", "Protege dos raios solares", 10.00, "Alimento"),
("Creme Cetaphill", "Hidrata sua pele", 69.90, "Saúde"),
("Macarrão Penny", "Melhor macarrão já inventado", 8.90, "Alimento"),
("Pista Ataque Tubarão Hot Wheels", "Cuidado com a mordida do tubarão... AAAAH", 399.90, "Brinquedos"),
("Cadeira ergonômica", "Salvando a sua postura", 2000.00, "Escritório"),
("Fubá da galáxia", "Um fubá de outro mundo", 12.99, "Alimento");

#Filtrando produtos com um valor maior que 500
SELECT * FROM tb_produtos WHERE preco > 500.00;

#Filtrando produtos com um valor menor que 500
SELECT * FROM tb_produtos WHERE preco < 500;

#Atualizando um registro da tabela
UPDATE tb_produtos SET preco = 15.99 WHERE id = 8;

SELECT * FROM tb_produtos;

-- EXTRAS:

#Ordenando os produtos por ordem alfabética
SELECT * FROM tb_produtos ORDER BY nome ASC;

#Ordenando do maior preço para o menor
SELECT * FROM tb_produtos ORDER BY preco DESC;

#Filtrando preços entre 500 e 3000
SELECT * FROM tb_produtos WHERE preco BETWEEN 500 AND 3000;

#Filtrando todos os produtos da categoria alimento
SELECT * FROM tb_produtos WHERE categoria LIKE "%ALIMENTO%";