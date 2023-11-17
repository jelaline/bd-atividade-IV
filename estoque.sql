CREATE DATABASE estoque;


USE estoque;


CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    quantidade_estoque INT
);

-- Inserindo produtos no estoque
INSERT INTO produtos (nome, quantidade_estoque) VALUES
('Camiseta', 500),
('Calça Jeans', 310),
('Tênis', 20),
('Relógio', 115),
('Bolsa', 265);



CREATE TABLE vendas (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    data_venda DATETIME
);

INSERT INTO vendas (data_venda) VALUES ('2023-11-16 11:35:05');


CREATE TABLE itens_venda (
    id_item_venda INT PRIMARY KEY AUTO_INCREMENT,
    id_venda INT,
    id_produto INT,
    quantidade INT,
    FOREIGN KEY (id_venda) REFERENCES vendas(id_venda),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

INSERT INTO itens_venda (id_venda, id_produto, quantidade) VALUES
(1, 1, 3), -- 3 camisetas
(1, 3, 2), -- 2 tênis
(1, 4, 1); -- 1 relógio

DELIMITER //
CREATE TRIGGER verificar_estoque
BEFORE INSERT ON itens_venda
FOR EACH ROW
BEGIN
    DECLARE estoque_atual INT;
    SELECT quantidade_estoque INTO estoque_atual FROM produtos WHERE id_produto = NEW.id_produto;
    
    IF estoque_atual < NEW.quantidade THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Produto fora de estoque.';
    END IF;
END //
DELIMITER ;

