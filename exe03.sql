CREATE DATABASE db_escola;

USE db_escola;

CREATE TABLE tb_estudantes(
	id BIGINT auto_increment,
    nome VARCHAR(150),
    ano VARCHAR(100),
    turma VARCHAR(100),
    media DECIMAL(6,2),
    PRIMARY KEY (id)
);

INSERT INTO tb_estudantes(nome, ano, turma, media)
VALUES ("Eduardo Wada", "9º ano", "1A", 10.00),
("Maria Julia", "9º ano", "1A", 10.00),
("Vinicius Luis", "8º ano", "2B", 4.75),
("Anderson Silva", "3º ano", "1C", 8.50),
("Rio Negro e Solimões Soares", "7º ano", "2A", 7.70),
("Ronnie Colleman", "3º ano", "1A", 9.83),
("Tião Carreiro", "9º ano", "1B", 8.75),
("Paulo Sergio Coelho", "8º ano", "1A", 5.45);

#Estudantes com nota maior que 7
SELECT * FROM tb_estudantes WHERE media > 7.00;

#Estudantes com nota menor que 7
SELECT * FROM tb_estudantes WHERE media < 7.00;

#Atualizando um registro da tabela
UPDATE tb_estudantes SET media = 7.15 where id = 4;

-- EXTRA

#Filtrando todos os alunos que são do 9º ano
SELECT * FROM tb_estudantes WHERE ano LIKE "%9%";

#Ordenando os alunos por ordem alfabética
SELECT * FROM tb_estudantes ORDER BY nome ASC;