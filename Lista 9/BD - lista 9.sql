CREATE DATABASE BD;
USE BD;
-----------
CREATE TABLE Departamento(
	PRIMARY KEY (Codigo_depto),
	Codigo_depto int IDENTITY,
	NomeDepto varchar(60)
);
-----------
CREATE TABLE Funcionarios(
	PRIMARY KEY (Codigo_func),
	FOREIGN KEY (Codigo_depto) REFERENCES Departamento,
	Codigo_depto int,
	Codigo_func int IDENTITY,
	NomeFunc varchar(60),
	SobreNome varchar(60),
	DataNasc datetime,
	CPF varchar(30),
	RG varchar(30),
	Endereco varchar(60),
	CEP varchar(15),
	Cidade varchar(60),
	Fone varchar(15),
	Funcao varchar(60),
	Salario int
);
-----------
INSERT INTO Departamento (NomeDepto) VALUES ('DEVELOPER'), ('ANALYST'), ('SUPERVISOR');
-----------
INSERT INTO Funcionarios (NomeFunc, SobreNome, Codigo_depto, DataNasc, CPF, RG, Endereco, CEP, Cidade, Fone, Funcao, Salario) VALUES
('John', 'Doe', 1, '15/05/1985', '111.222.333', '444.555.666', '123 Main St', '12345', 'New York', '555-1234', 'Senior Developer', 100000),
('Jane', 'Smith', 1, '20/10/1990', '222.333.444', '555.666.777', '456 Elm St', '54321', 'Los Angeles', '555-4321', 'Senior Developer', 100000),
('David', 'Johnson', 1, '08/03/1988', '333.444.555', '666.777.888', '789 Oak St', '98765', 'Chicago', '555-7890', 'Senior Developer', 100000),
('Sarah', 'Williams', 1, '12/07/1995', '444.555.666', '777.888.999', '321 Maple Ave', '56789', 'Houston', '555-9876', 'Junior Developer', 50000),
('Michael', 'Brown', 1, '25/01/1992', '555.666.777', '888.999.000', '654 Pine Rd', '09876', 'Miami', '555-6789', 'Junior Developer', 50000),
('Emily', 'Davis', 1, '05/09/1998', '666.777.888', '999.000.111', '987 Cedar Ln', '45678', 'Seattle', '555-7654', 'Junior Developer', 50000),
('Christopher', 'Wilson', 2, '15/06/1987', '777.888.999', '000.111.222', '741 Oak Ave', '34567', 'San Francisco', '555-2345', 'Manager', 90000),
('Jessica', 'Taylor', 2, '28/02/1994', '888.999.000', '111.222.333', '852 Elm St', '65432', 'Boston', '555-5432', 'Manager', 90000),
('Andrew', 'Thomas', 2, '10/11/1989', '999.000.111', '222.333.444', '963 Maple Dr', '76543', 'Denver', '555-3210', 'Manager', 90000),
('Olivia', 'Martin', 2, '03/04/1997', '111.222.333', '333.444.555', '369 Pine St', '54321', 'Austin', '555-0123', 'Analyst', 40000),
('Daniel', 'Clark', 2, '18/08/1991', '222.333.444', '444.555.666', '582 Oak Ave', '87654', 'San Diego', '555-2109', 'Analyst', 40000),
('Sophia', 'Lee', 2, '01/12/1996', '333.444.555', '555.666.777', '741 Elm St', '98765', 'Phoenix', '555-1098', 'Analyst', 40000),
('Matthew', 'Harris', 3, '24/03/1993', '444.555.666', '666.777.888', '963 Pine Rd', '56789', 'Dallas', '555-0987', 'Supervisor', 80000),
('Ava', 'Garcia', 3, '09/08/1999', '555.666.777', '777.888.999', '258 Maple Ave', '45678', 'San Antonio', '555-8765', 'Supervisor', 80000),
('James', 'Martinez', 3, '02/12/1990', '666.777.888', '888.999.000', '741 Oak St', '34567', 'Las Vegas', '555-7654', 'Supervisor', 80000),
('Isabella', 'Robinson', 3, '07/11/1996', '777.888.999', '999.000.111', '852 Cedar Ln', '65432', 'Philadelphia', '555-6543', 'Coordinator', 60000),
('Benjamin', 'Clark', 3, '01/01/1992', '888.999.000', '111.222.333', '963 Pine Rd', '54321', 'Atlanta', '555-5432', 'Coordinator', 60000),
('Mia', 'Lopez', 3, '05/03/1997', '999.000.111', '222.333.444', '369 Oak Ave', '43210', 'Recife', '555-4321', 'Telefonista', 60000);
-----------
--Listar nome e sobrenome ordenado por sobrenome--
select SobreNome, NomeFunc from Funcionarios order by SobreNome;
--Listar todos os campos de funcionários ordenados por cidade--
select * from Funcionarios order by Cidade;
--Listar os funcionários que têm salário superior a R$ 1.000,00 ordenados pelo nome completo--
select * from Funcionarios where Salario > 1000 order by NomeFunc, SobreNome;
--Listar a data de nascimento e o primeiro nome dos funcionários ordenados do mais novo para o mais velho--
select NomeFunc, DataNasc from Funcionarios order by DataNasc desc;
--Listar os funcionários nesta sequência de campos: Sobrenome, nome, cidade, endereço, fone--
select SobreNome, NomeFunc, Cidade, Endereco, Fone from Funcionarios;
--Listar o total da folha de pagamento--
select sum(Salario) from Funcionarios;
--Listar o nome completo, o salário e a função de todos os funcionários ordenados por função--
select NomeFunc, SobreNome, Salario, Funcao from Funcionarios order by Funcao;
--Listar os funcionários que têm a função de supervisor--
select * from Funcionarios where Funcao like 'SUPERVISOR';
--Liste a quantidade de funcionários desta empresa--
select count(NomeFunc) from Funcionarios;
--Liste o salário médio pago pela empresa--
select avg(Salario) from Funcionarios;
--Liste os nomes dos funcionários que moram em Recife e que exerçam a função de Telefonista--
select * from Funcionarios where Cidade like 'Recife' and Funcao like 'TELEFONISTA';
select * from Departamento
select * from Funcionarios