create database biblioteca;

use biblioteca;


CREATE TABLE Livros(
id_livro int primary key auto_increment,
titulo varchar(50) not null,
autor varchar(50) not null,
quantidade_estoque int not null
);

INSERT INTO Livros (id_livro, titulo, autor, quantidade_estoque) values
(1, 'one day', 'David Nicholls', 500),
(2, 'pinoquio', 'Carlo Collodi', 300);

CREATE TABLE Emprestimos(
id_emprestimo int primary key,
id_livro int,
data_emprestimo datetime,
data_evolucao datetime,
foreign key (id_livro) references Livros (id_livro)
);


INSERT INTO emprestimos (id_emprestimo, id_livro, data_emprestimo, data_evolucao)
VALUES (2, 2, '2023-11-10 10:30:00', '2023-11-20 14:50:00');

DELIMITER //

CREATE TRIGGER atualizar_estoque
AFTER INSERT ON emprestimos
FOR EACH ROW
BEGIN
    UPDATE livros
    SET quantidade_estoque = quantidade_estoque - 1
    WHERE id_livro = NEW.id_livro;
END//

DELIMITER ;


Select * from livros;

select * from emprestimos;
