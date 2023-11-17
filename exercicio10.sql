CREATE DATABASE gerenciamento_pagamentos;

USE gerenciamento_pagamentos;


CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    endereco VARCHAR(100),
    cidade VARCHAR(50)
);


CREATE TABLE pagamentos (
id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
id_cliente INT,
data_pagamento DATE,
valor_pagamento DECIMAL(10, 2),
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);


INSERT INTO clientes (nome, endereco, cidade) VALUES
('jessica', 'Rua da penha, 123', 'Salvador'),
('fernanda', 'Avenida joão miguel, 456', 'Rio de Janeiro'),
('gabriel', 'Rua da belgica, 789', 'Salvador'),
('caio', 'Avenida eduardo magalhães, 101', 'Salvador'),
('henrique', 'Rua são francisco, 222', 'Rio de Janeiro');


INSERT INTO pagamentos (id_cliente, data_pagamento, valor_pagamento) VALUES
(1, '2023-01-05', 150.00),
(2, '2023-02-10', 75.50),
(3, '2023-03-15', 200.00),
(4, '2023-04-20', 300.00),
(1, '2023-05-25', 120.00),
(3, '2023-06-30', 50.00),
(2, '2023-07-05', 180.00),
(5, '2023-08-10', 90.00);


CREATE VIEW relatorio_pagamentos_cidade AS
SELECT cidade, SUM(valor_pagamento) AS total_pagamentos
FROM clientes c
JOIN pagamentos p ON c.id_cliente = p.id_cliente
GROUP BY cidade;


SELECT cidade, total_pagamentos
FROM relatorio_pagamentos_cidade;

