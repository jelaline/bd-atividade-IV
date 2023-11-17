CREATE DATABASE gerenciamento_pedidos;

USE gerenciamento_pedidos;


CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    email VARCHAR(100),
    telefone VARCHAR(20)
);


CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);


INSERT INTO clientes (nome, email, telefone) VALUES
('amanda', 'amanda@gmail.com', '(71) 985673-6543'),
('bruno', 'bruno@gmail.com', '(72) 98764-2134'),
('sergio', 'sergio@gmail.com', '(72) 99654-0987');


INSERT INTO pedidos (id_cliente, valor_total) VALUES
(1, 150.00),
(1, 75.50),
(2, 200.00),
(3, 300.00),
(2, 50.00),
(1, 120.00);


CREATE VIEW relatorio_pedidos_cliente AS
SELECT c.nome AS nome_cliente, COUNT(p.id_pedido) AS num_pedidos, SUM(p.valor_total) AS total_gasto
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome;

SELECT nome_cliente, num_pedidos, total_gasto
FROM relatorio_pedidos_cliente;

