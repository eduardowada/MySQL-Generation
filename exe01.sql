CREATE DATABASE db_empresarh;

USE db_empresarh;

CREATE TABLE tb_colaboradores(
	id BIGINT auto_increment,
    nome VARCHAR(150),
    cargo VARCHAR(150),
    salario DECIMAL(8,2),
    data_admissao DATE,
    departamento VARCHAR(150),
    PRIMARY KEY (id)
);

INSERT INTO tb_colaboradores (nome, cargo, salario, data_admissao, departamento)
VALUES ("Eduardo Wada", "Desenvolvedor", 5700.00, "2024-04-05", "TI"),
("Maria Nicolau", "Gerente", 9800.00, "2024-04-05", "RH"),
("Diego Gonçalves", "Analista", 3700.00, "2024-04-05", "Financeiro"),
("Julia Oliveira", "Coordenadora", 7700.00, "2024-05-05", "RH"),
("João Soares", "Estagiário", 1700.00, "2024-06-05", "TI");

#Filtrando Salários maior que 2000
SELECT * FROM tb_colaboradores WHERE salario > 2000.00;

#Filtrando Salários menor que 2000
SELECT * FROM tb_colaboradores WHERE salario < 2000.00;

#Atualizando um registro da tabela
UPDATE tb_colaboradores SET salario = 9999.00 WHERE id = 2;

SELECT * FROM tb_colaboradores;

-- EXTRAS:

#Ordenando os colaboradores por ordem alfabética
SELECT * FROM tb_colaboradores ORDER BY nome ASC;

#Ordenando do maior salário para o menor
SELECT * FROM tb_colaboradores ORDER BY salario DESC;

#Filtrando salários entre 5000 e 9000
SELECT * FROM tb_colaboradores WHERE salario BETWEEN 5000 AND 9000;

#Filtrando todos os nomes que tenham a letra S em algum lugar do nome
SELECT * FROM tb_colaboradores WHERE nome LIKE "%s%";