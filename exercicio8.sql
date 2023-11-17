CREATE DATABASE relatorio_vendas;


USE relatorio_vendas;


CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    cargo VARCHAR(50),
    salario DECIMAL(10, 2)
);


CREATE TABLE vendas (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    id_funcionario INT,
    data_venda DATE,
    valor_venda DECIMAL(10, 2),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);


INSERT INTO funcionarios (nome, cargo, salario) VALUES
    ('maria', 'Vendedor', 3000.00),
    ('jessica', 'Vendedor', 2800.00),
    ('gabriel', 'Gerente', 5000.00),
    ('luis', 'Vendedor', 3200.00);


INSERT INTO vendas (id_funcionario, data_venda, valor_venda) VALUES
    (1, '2023-11-01', 1000.00),
    (2, '2023-11-02', 750.50),
    (3, '2023-11-03', 2000.00),
    (4, '2023-11-04', 1500.25),
    (1, '2023-11-05', 1200.00),
    (2, '2023-11-06', 800.50),
    (3, '2023-11-07', 1800.00),
    (4, '2023-11-08', 1300.25);


CREATE VIEW relatorio_vendas_funcionario AS
SELECT f.nome AS nome_funcionario, COUNT(v.id_venda) AS num_vendas, SUM(v.valor_venda) AS total_vendas
FROM funcionarios f
LEFT JOIN vendas v ON f.id_funcionario = v.id_funcionario
GROUP BY f.nome;

SELECT * FROM relatorio_vendas_funcionario;