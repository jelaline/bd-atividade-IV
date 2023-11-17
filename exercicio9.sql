CREATE DATABASE relatorio_produtos;


USE relatorio_produtos;

CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(50),
    descricao VARCHAR(100)
);


CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    preco_unitario DECIMAL(10, 2),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);


INSERT INTO categorias (nome_categoria, descricao) VALUES
    ('Eletrônicos', 'Produtos eletrônicos'),
    ('Roupas', 'Diversos tipos de vestuário'),
    ('Acessórios', 'Acessórios para uso diário');


INSERT INTO produtos (nome, preco_unitario, id_categoria) VALUES
    ('Celular', 7000.00, 1),
    ('Televisão', 13500.00, 1),
    ('Camiseta', 30.00, 2),
    ('Calça Jeans', 50.00, 2),
    ('Óculos de Sol', 80.00, 3),
    ('Relógio', 120.00, 3),
    ('Notebook', 6000.00, 1);


CREATE VIEW relatorio_produtos_categoria AS
SELECT c.nome_categoria, COUNT(p.id_produto) AS quantidade_produtos
FROM categorias c
LEFT JOIN produtos p ON c.id_categoria = p.id_categoria
GROUP BY c.nome_categoria;


SELECT * FROM relatorio_produtos_categoria;