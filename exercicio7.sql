CREATE DATABASE gerenciamento_de_estoque;


USE gerenciamento_de_estoque;


CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    preco_unitario DECIMAL(10, 2),
    categoria VARCHAR(50)
);


CREATE TABLE estoque (
    id_produto INT PRIMARY KEY,
    quantidade INT,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);


INSERT INTO produtos (nome, preco_unitario, categoria) VALUES
    ('playstation 5', 5000.00, 'Eletrônicos'),
    ('calça', 80.00, 'Roupas'),
    ('iphone 15', 8400.00, 'Eletrônicos'),
    ('relogio', 180.00, 'Acessórios');


INSERT INTO estoque (id_produto, quantidade) VALUES
    (1, 5),
    (2, 10),
    (3, 3),
    (4, 7);


CREATE VIEW estoque_critico AS
SELECT p.nome, e.quantidade
FROM produtos p
INNER JOIN estoque e ON p.id_produto = e.id_produto
WHERE e.quantidade < 5; 


SELECT * FROM estoque_critico;
