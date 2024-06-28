CREATE DATABASE db_curso_da_minha_vida;

USE db_curso_da_minha_vida;

-- Criando a tabela tb_categorias
CREATE TABLE tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255) NOT NULL
);

-- Criando a tabela tb_cursos
CREATE TABLE tb_cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    duracao_horas INT NOT NULL,
    preco DECIMAL(7,2) NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

-- Inserindo registros na tabela tb_categorias
INSERT INTO tb_categorias (nome, descricao) VALUES
('Programação', 'Cursos relacionados a programação e desenvolvimento de software'),
('Design', 'Cursos relacionados a design gráfico e web design'),
('Marketing', 'Cursos relacionados a marketing digital e estratégias de vendas'),
('Negócios', 'Cursos relacionados a gestão de negócios e empreendedorismo'),
('Idiomas', 'Cursos de aprendizagem de novos idiomas');

-- Inserindo registros na tabela tb_cursos
INSERT INTO tb_cursos (nome, descricao, duracao_horas, preco, id_categoria) VALUES
('Curso de Java', 'Aprenda a programar em Java desde o básico até o avançado.', 60, 800.00, 1),
('Curso de Python', 'Curso completo de Python para análise de dados.', 40, 650.00, 1),
('Curso de Photoshop', 'Domine o Photoshop e crie designs incríveis.', 30, 500.00, 2),
('Curso de Illustrator', 'Aprenda a usar o Adobe Illustrator como um profissional.', 35, 550.00, 2),
('Curso de Marketing Digital', 'Estratégias de marketing digital para impulsionar seu negócio.', 50, 700.00, 3),
('Curso de SEO', 'Otimização para motores de busca (SEO) para iniciantes.', 25, 300.00, 3),
('Curso de Gestão Empresarial', 'Fundamentos da gestão empresarial moderna.', 40, 1000.00, 4),
('Curso de Inglês', 'Curso completo de inglês para iniciantes.', 60, 450.00, 5);

-- SELECT que retorna todos os cursos cujo valor seja maior do que R$ 500,00
SELECT * FROM tb_cursos WHERE preco > 500.00;

-- SELECT que retorna todos os cursos cujo valor esteja no intervalo R$ 600,00 e R$ 1000,00
SELECT * FROM tb_cursos WHERE preco BETWEEN 600.00 AND 1000.00;

-- SELECT utilizando o operador LIKE, buscando todos os cursos que possuam a letra J no atributo nome
SELECT * FROM tb_cursos WHERE nome LIKE '%J%';

-- SELECT utilizando INNER JOIN, unindo os dados da tabela tb_cursos com os dados da tabela tb_categorias
SELECT c.*, cat.nome AS categoria_nome, cat.descricao AS categoria_descricao
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.id_categoria = cat.id;

-- SELECT utilizando INNER JOIN, unindo os dados da tabela tb_cursos com os dados da tabela tb_categorias, onde traga apenas os cursos que pertencem a uma categoria específica (Exemplo: Todos os cursos que pertencem a categoria Java)
SELECT c.*, cat.nome AS categoria_nome, cat.descricao AS categoria_descricao
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.id_categoria = cat.id
WHERE cat.nome = 'Programação';
