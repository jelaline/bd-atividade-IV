
CREATE DATABASE recursos_humanos;


USE recursos_humanos;


CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    data_admissao DATE
);


INSERT INTO funcionarios (nome, data_admissao) VALUES
('João Silva', '2022-02-15'),
('Maria Santos', '2023-12-01'),
('Pedro Oliveira', '2024-06-10');


DELIMITER //
CREATE TRIGGER verificar_data_admissao
BEFORE INSERT ON funcionarios
FOR EACH ROW
BEGIN
    IF NEW.data_admissao <= CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A data de admissão deve ser maior que a data atual.';
    END IF;
END //
DELIMITER ;