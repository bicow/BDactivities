CREATE DATABASE Danilo_CD;
USE Danilo_CD;
drop table Cds;
drop table musicas;
select * from cds;

CREATE TABLE Cds(
	PRIMARY KEY (Codigo),
	Codigo int identity,
	Nome_cd varchar(60),
	DataCompra datetime,
	LocalCompra varchar(120),
	Album varchar(3),
    Preco float,
);

CREATE TABLE Musicas(
	FOREIGN KEY (CodigoCD) references Cds,
	CodigoCD int,
	Numero_musica int,
	Nome_musica varchar(60),
	Artista varchar(60),
	Tempo varchar(8),
);

--INSERTS TABLE Cds
INSERT INTO Cds (Nome_cd, DataCompra, LocalCompra, Album, Preco) VALUES 
('Roberto Carlos', '18/12/2012', 'Submarino', 'Sim', 15.00),
('Amado Batista', '08/07/2010', 'Amazon', 'Sim', 16.00),
('Gino e Geno', '01/02/2009', 'Submarino', 'Sim', 10.50),
('José Pedro', '03/07/2007', 'Casas Bahia', 'Não', 25.00),
('Led Zeppelin', '03/07/2000', 'Amazon', 'Sim', 14.00);

--INSERTS TABLE Musicas
INSERT INTO Musicas (CodigoCD, Numero_musica, Nome_musica, Artista, Tempo) VALUES 
(1, 1, 'Eu te amo tanto', 'Roberto Carlos', '0:5:49'),
(1, 1, 'O amor é mais', 'Roberto Carlos', '0:5:33'),
(1, 1, 'Tu és verdade, Jesus', 'Roberto Carlos', '0:4:56'),
(1, 1, 'O grude (um em outro)', 'Roberto Carlos', '0:4:20'),
(1, 1, 'Eu te amo tanto', 'Roberto Carlos', '0:5:49'),
(1, 2, 'Mulher pequena', 'Roberto Carlos', '0:4:16'),
(1, 2, 'Quando digo que te amo', 'Roberto Carlos', '0:4:36'),
(2, 2, 'Meu doce amor', 'Amado Batista', '0:3:56'),
(2, 2, 'Estou só', 'Amado Batista', '0:3:29'),
(3, 2, 'Apaixonado por você', 'Gino e Geno', '0:4:07'),
(4, 3, 'Meu poeta', 'José pedro', '0:3:27'),
(4, 3, 'Meu doce amor', 'José pedro', '0:3:56'),
(5, 3, 'Four sticks', 'Led Zeppelin', '0:4:45'),
(5, 3, 'Stairway to Heaven', 'Led Zeppelin', '0:8:02'),
(5, 3, 'Black dog', 'Led Zeppelin', '0:4:56');

-- Exercício 1
SELECT Nome_Cd, Nome_Musica FROM Cds
INNER JOIN Musicas
ON Codigo = CodigoCD;

-- Exercício 2
SELECT Nome_Cd, Nome_Musica FROM Cds
INNER JOIN Musicas
ON Codigo = CodigoCD
WHERE Numero_musica = 1;