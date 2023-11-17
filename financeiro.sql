CREATE DATABASE financeiro;


USE financeiro;


CREATE TABLE contas (
    id_conta INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    saldo DECIMAL(10, 2)
);


INSERT INTO contas (nome, saldo) VALUES
('Conta Corrente', 10000.00),
('Conta Poupança', 3800.00),
('Carteira', 1000.00),
('Investimento', 17500.00),
('Reserva Emergencial', 8000.00);



CREATE TABLE transacoes (
    id_transacao INT PRIMARY KEY AUTO_INCREMENT,
    id_conta INT,
    tipo VARCHAR(10),
    valor DECIMAL(10, 2),
    FOREIGN KEY (id_conta) REFERENCES contas(id_conta)
);

INSERT INTO transacoes (id_conta, tipo, valor) VALUES
(1, 'entrada', 1500.00),
(3, 'saída', 300.00),
(2, 'entrada', 100.00),
(4, 'saída', 2000.00),
(5, 'saída', 500.00);



DELIMITER //
CREATE TRIGGER atualizar_saldo
AFTER INSERT ON transacoes
FOR EACH ROW
BEGIN
    DECLARE saldo_atual DECIMAL(10, 2);
    SELECT saldo INTO saldo_atual FROM contas WHERE id_conta = NEW.id_conta;
    
    IF NEW.tipo = 'entrada' THEN
        UPDATE contas
        SET saldo = saldo_atual + NEW.valor
        WHERE id_conta = NEW.id_conta;
    ELSEIF NEW.tipo = 'saída' THEN
        UPDATE contas
        SET saldo = saldo_atual - NEW.valor
        WHERE id_conta = NEW.id_conta;
    END IF;
END //
DELIMITER ;

SELECT c.id_conta, c.nome, c.saldo, 
       COALESCE(SUM(CASE WHEN t.tipo = 'entrada' THEN t.valor ELSE -t.valor END), 0) AS saldo_atualizado
FROM contas c
LEFT JOIN transacoes t ON c.id_conta = t.id_conta
GROUP BY c.id_conta, c.nome, c.saldo;