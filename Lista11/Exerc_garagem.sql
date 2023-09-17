CREATE DATABASE Danilo_Exerc_Garagem;
USE Danilo_Exerc_Garagem;
DROP DATABASE Danilo_Exerc_Garagem;

CREATE TABLE Cliente (
	PRIMARY KEY (cpf),
	cpf VARCHAR(20) NOT NULL,
	nome VARCHAR(60),
	nasc DATETIME,
);

CREATE TABLE Patio (
	PRIMARY KEY (patio_num),
	patio_num INT IDENTITY,
	ender VARCHAR(200),
	capacidade INT,
);

CREATE TABLE Modelo (
	PRIMARY KEY (codMod),
	codMod INT IDENTITY,
	desc_mod VARCHAR(60)
);

CREATE TABLE Veiculo (
	PRIMARY KEY (placa),
	FOREIGN KEY (codMod) REFERENCES Modelo,
	FOREIGN KEY (cpf) REFERENCES Cliente,
	placa VARCHAR(10),
	codMod INT,
	cpf VARCHAR(20) NOT NULL,
	cor VARCHAR(20),
	ano INT
);

CREATE TABLE Estaciona (
	PRIMARY KEY (cod),
	FOREIGN KEY (patio_num) REFERENCES Patio,
	FOREIGN KEY (placa) REFERENCES Veiculo,
	cod INT IDENTITY,
	patio_num INT,
	placa VARCHAR(10),
	dtEntrada DATETIME,
	dtSaida DATETIME,
	hsEntrada INT,
	hsSaida INT
);

INSERT INTO Cliente (nome, cpf, nasc)
VALUES 
('Danilo Rodrigues', '12345678978', '21/11/2005'),
('Gabriel Mendes', '11111111111', '11/09/2001'),
('João Vitor', '22222222222', '05/05/2000'),
('Henrique Machado', '33333333333', '15/11/1989'),
('Lucas Carvalho', '44444444444', '15/11/1999'),
('Paulo Enrick', '55555555555', '12/10/1960');

INSERT INTO Modelo (desc_mod)
VALUES 
('SUV'),
('SEDAN'),
('HATCH'),
('PICAPE');

INSERT INTO Veiculo (placa, codMod, cpf, cor, ano)
VALUES 
('ABC-1234', 1, '12345678978', 'Verde', 2000),
('JJJ-2020', 2, '11111111111', 'Vermelho', 2005),
('HIJ-9012', 2, '33333333333', 'Amarelo', 2020),
('KLM-3456', 4, '44444444444', 'Preto', 2030),
('JEG-1010', 2, '55555555555', 'Branco', 1976),
('XYZ-2222', 2, '22222222222', 'Cinza', 1986);

INSERT INTO Patio (ender, capacidade)
VALUES
('Rua 1', 75),
('Rua 2', 50),
('Rua 3', 12);

INSERT INTO Estaciona (patio_num, placa, dtEntrada, dtSaida, hsEntrada, hsSaida)
VALUES 
(1, 'JEG-1010', '05/05/2023', '05/12/2023', 05, 21),
(2, 'JJJ-2020', '01/03/2020', '09/02/2023', 08, 09),
(3, 'ABC-1234', '01/03/2020', '09/02/2023', 09, 15),
(2, 'KLM-3456', '01/03/2020', '09/02/2023', 10, 22),
(1, 'JJJ-2020', '12/03/2024', '09/05/2024', 14, 00);

-- Exercício a
SELECT nome, placa FROM Cliente
INNER JOIN Veiculo
ON Cliente.cpf = Veiculo.cpf;

-- Exercício b
SELECT Cliente.cpf, nome FROM Cliente 
INNER JOIN Veiculo
ON Cliente.cpf = Veiculo.cpf
WHERE placa LIKE 'JJJ-2020';

-- Exercício c
SELECT Veiculo.placa, cor FROM Veiculo
INNER JOIN Estaciona
ON Veiculo.placa = Estaciona.placa
WHERE Estaciona.cod = 1;

-- Exercício d
SELECT Veiculo.placa, ano FROM Veiculo
INNER JOIN Estaciona
ON Veiculo.placa = Estaciona.placa
WHERE Estaciona.cod = 1;

-- Exercício e
SELECT Veiculo.placa, ano, desc_mod FROM Veiculo 
INNER JOIN Modelo
ON Veiculo.codMod = Modelo.codMod
WHERE ano >= 2000;

-- Exercício f
SELECT ender, dtEntrada, dtSaida FROM Estaciona 
INNER JOIN Veiculo ON Estaciona.placa = Veiculo.placa
INNER JOIN Patio ON Estaciona.patio_num = Patio.patio_num
WHERE Veiculo.placa LIKE 'JEG-1010';

-- Exercício g
SELECT COUNT(cod) as 'Vezes estacionadas' FROM Estaciona
INNER JOIN Veiculo
ON Estaciona.placa = Veiculo.placa
WHERE Veiculo.cor LIKE 'Verde';

-- Exercício h
SELECT Cliente.* FROM Cliente 
INNER JOIN Veiculo ON Cliente.cpf = Veiculo.cpf
INNER JOIN Modelo ON Modelo.codMod = Veiculo.codMod
WHERE Modelo.codMod = 1;

-- Exercício i
SELECT Veiculo.placa, dtEntrada, dtSaida FROM Estaciona
INNER JOIN Veiculo
ON Veiculo.placa = Estaciona.placa
WHERE Veiculo.cor LIKE 'Verde';

-- Exercício j
SELECT Estaciona.* FROM Estaciona
INNER JOIN Veiculo
ON Veiculo.placa = Estaciona.placa
WHERE Veiculo.placa LIKE 'JJJ-2020';

-- Exercício k
SELECT nome FROM CLIENTE
INNER JOIN Veiculo ON Cliente.cpf = Veiculo.cpf
INNER JOIN Estaciona ON Veiculo.placa = Estaciona.placa
WHERE Estaciona.cod = 2;

-- Exercício l
SELECT Cliente.cpf FROM CLIENTE
INNER JOIN Veiculo ON Cliente.cpf = Veiculo.cpf
INNER JOIN Estaciona ON Veiculo.placa = Estaciona.placa
WHERE Estaciona.cod = 3;

-- Exercício m
SELECT desc_mod FROM Modelo
INNER JOIN Veiculo ON Modelo.codMod = Veiculo.codMod
INNER JOIN Estaciona ON Veiculo.placa = Estaciona.placa
WHERE Estaciona.cod = 2;

-- Exercício n
SELECT placa, nome, desc_mod FROM Veiculo
INNER JOIN Modelo ON Veiculo.codMod = Modelo.codMod
INNER JOIN Cliente ON Cliente.cpf = Veiculo.cpf;
