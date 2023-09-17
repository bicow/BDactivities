CREATE DATABASE BD_lista08;
USE BD_lista08;

CREATE TABLE Cds(
	PRIMARY KEY (Codigo),
	Codigo int identity,
	Nome_cd varchar(60),
	DataCompra datetime,
	LocalCompra varchar(120),
	Album varchar(3),
    Preco int,
);

CREATE TABLE Musicas(
	FOREIGN KEY (Codigo) references Cds,
	Codigo int,
	Numero_musica int identity,
	Nome_musica varchar(60),
	Artista varchar(60),
	Tempo int,
);

--INSERTS TABLE Cds
INSERT INTO Cds (Nome_cd, DataCompra, LocalCompra, Album, Preco) VALUES ('Roberto Carlos', '18/12/2012', 'Submarino', 'Sim', 15);
INSERT INTO Cds (Nome_cd, DataCompra, LocalCompra, Album, Preco) VALUES ('Amado Batista', '08/07/2010', 'Amazon', 'Sim', 16);
INSERT INTO Cds (Nome_cd, DataCompra, LocalCompra, Album, Preco) VALUES ('Gino e Geno', '01/02/2009', 'Submarino', 'Sim', 10);
INSERT INTO Cds (Nome_cd, DataCompra, LocalCompra, Album, Preco) VALUES ('José Pedro', '03/07/2007', 'Casas Bahia', 'Não', 25);
INSERT INTO Cds (Nome_cd, DataCompra, LocalCompra, Album, Preco) VALUES ('Led Zeppelin', '03/07/2000', 'Amazon', 'Sim', 14);

--INSERTS TABLE Musicas
INSERT INTO Musicas (Codigo, Nome_musica, Artista, Tempo) VALUES (1, 'Eu te amo tanto', 'Roberto Carlos', 5);
INSERT INTO Musicas (Codigo, Nome_musica, Artista, Tempo) VALUES (1, 'O amor é mais', 'Roberto Carlos', 4);
INSERT INTO Musicas (Codigo, Nome_musica, Artista, Tempo) VALUES (1, 'Tu és verdade, Jesus', 'Roberto Carlos', 5);
INSERT INTO Musicas (Codigo, Nome_musica, Artista, Tempo) VALUES (1, 'O grude (um em outro)', 'Roberto Carlos', 3);
INSERT INTO Musicas (Codigo, Nome_musica, Artista, Tempo) VALUES (1, 'Eu te amo tanto', 'Roberto Carlos', 5);
INSERT INTO Musicas (Codigo, Nome_musica, Artista, Tempo) VALUES (1, 'Mulher pequena', 'Roberto Carlos', 5);
INSERT INTO Musicas (Codigo, Nome_musica, Artista, Tempo) VALUES (1, 'Quando digo que te amo', 'Roberto Carlos', 2);
INSERT INTO Musicas (Codigo, Nome_musica, Artista, Tempo) VALUES (2, 'Meu doce amor', 'Amado Batista', 4);
INSERT INTO Musicas (Codigo, Nome_musica, Artista, Tempo) VALUES (2, 'Estou só', 'Amado Batista', 5);
INSERT INTO Musicas (Codigo, Nome_musica, Artista, Tempo) VALUES (3, 'Apaixonado por você', 'Gino e Geno', 3);
INSERT INTO Musicas (Codigo, Nome_musica, Artista, Tempo) VALUES (4, 'Meu poeta', 'José pedro', 5);
INSERT INTO Musicas (Codigo, Nome_musica, Artista, Tempo) VALUES (4, 'Meu doce amor', 'José pedro', 5);
INSERT INTO Musicas (Codigo, Nome_musica, Artista, Tempo) VALUES (5, 'Four sticks', 'Led Zeppelin', 3);
INSERT INTO Musicas (Codigo, Nome_musica, Artista, Tempo) VALUES (5, 'Stairway to Heaven', 'Led Zeppelin', 2);
INSERT INTO Musicas (Codigo, Nome_musica, Artista, Tempo) VALUES (5, 'Black dog', 'Led Zeppelin', 3);

--1. Mostrar todos os cds
select * from Cds;
--2. Mostrar os campos nome e data da compra dos cds ordenados por nome
select Nome_cd, DataCompra from Cds order by Nome_cd;
--3. Mostrar os campos nome e data da compra dos cds classificados por data de compra em ordem decrescente
select Nome_cd, DataCompra from Cds order by DataCompra desc;
--4. Mostrar os campos nome, data da compra e preço dos cds classificados por preço em ordem decrescente
select Nome_cd, DataCompra, Preco from Cds order by Preco desc;
--5. Mostrar o total gasto com a compra dos Cds
select sum(Preco) from Cds;
--6. Mostrar todas as músicas (todos os campos) do cds código 1
select * from Musicas where Codigo = 1;
--7. Mostre o nome da música e o artista de todas músicas cadastradas
select Nome_musica, Artista from Musicas;
--8. Mostre o número, nome e tempo das músicas do cd 5 em ordem de número
select Numero_musica, Nome_musica, Tempo from Musicas where Codigo = 5 order by Numero_musica;
--9. Mostre a quantidade de músicas cadastradas(total)
select count(Nome_musica) from Musicas;
--10. Mostre o nome das músicas do artista José Pedro
select Nome_musica from Musicas where Artista like 'José Pedro';
--11. Mostre o nome de todos cds comprados no Submarino
select * from Cds where LocalCompra like 'Submarino';
--12. Mostre uma listagem de músicas em ordem alfabética
select * from Cds order by Nome_cd;
--13. Mostrar todos os cds que são álbuns
select Nome_cd from Cds where Album like 'Sim'; 
--14. Mostrar a média de preços dos cds.
select avg(Preco) from Cds;

select * from Cds;
select * from Musicas;
drop table Musicas;
drop table Cds;
drop database BD_lista08;

-- (Subquery) Mostre o cd que custou mais caro
SELECT Nome_cd, Preco
FROM Cds
WHERE Preco = (select max(Preco) from Cds);

-- (Group by) Mostre o tempo total de músicas por cdSELECT Cds.Nome_cd, Musicas.sum(Tempo)FROM Cds inner join Musicason Cds.Codigo = Musicas.CodigoWHERE;-- (Group by) Mostre a quantidade de Cds-- (Group by) Mostre a quantidade de músicas por cds