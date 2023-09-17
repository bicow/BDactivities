CREATE DATABASE DR
USE DR

DROP TABLE funcionarios;
CREATE TABLE funcionarios(
	PRIMARY KEY (id),
	id int IDENTITY,
	nome varchar(60),
	email varchar(60),
	salario float,
	data_nascimento datetime,
	cidade varchar(60),
	estado varchar(2)
);

INSERT INTO funcionarios (nome, email, salario, data_nascimento, cidade, estado) 
VALUES ('João', 'joao1907@gmail.com', 8000.00, '20/05/1970', 'São Paulo', 'SP');
INSERT INTO funcionarios (nome, email, salario, data_nascimento, cidade, estado) 
VALUES ('Camila', 'camila@gmail.com', 3000.00, '23/07/1985', 'São Paulo', 'SP');
INSERT INTO funcionarios (nome, email, salario, data_nascimento, cidade, estado) 
VALUES ('Marcio', 'marcio@gmail.com', 900.00, '15/03/1982', 'Campinas', 'SP');
INSERT INTO funcionarios (nome, email, salario, data_nascimento, cidade, estado) 
VALUES ('Fernanda', 'fernanda@gmail.com', 3500.00, '18/08/1987', 'Rio de Janeiro', 'RJ');
INSERT INTO funcionarios (nome, email, salario, data_nascimento, cidade, estado) 
VALUES ('José', 'jose@gmail.com', 2200.00, '18/09/1990', 'Guaxupé', 'MG');
INSERT INTO funcionarios (nome, email, salario, data_nascimento, cidade, estado) 
VALUES ('Fabiano', 'fabiano@gmail.com', 6800.00, '18/09/1981', 'Poço de Caldas', 'MG');
INSERT INTO funcionarios (nome, email, salario, data_nascimento, cidade, estado) 
VALUES ('Marcos', 'marcos@gmail.com', 3200.00, '08/02/1989', 'Vitória', 'ES');

select * from funcionarios where nome like 'a%';
select * from funcionarios where nome like 'e%';
select * from funcionarios where nome like 'i%';
select * from funcionarios where nome like 'o%';
select * from funcionarios where nome like 'u%';

select nome, salario from funcionarios order by salario desc;

select nome, email from funcionarios order by nome;

select salario from funcionarios where apelido like 'TikToRyco';