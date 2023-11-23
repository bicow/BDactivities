/* Danilo Costa Rodrigues 3ºAMS */

-- Criação do banco de dados:
CREATE DATABASE IndustriaBeleza;
-- Abertua do banco
USE IndustriaBeleza;
use master
drop database IndustriaBeleza

-- Criação das tabelas:

-- Regiao (PK: codRegiao)
CREATE TABLE Regiao(
	PRIMARY KEY (codRegiao),
	codRegiao int IDENTITY,
	descricaoRegiao varchar(60),
	nomeRegiao varchar(60),
	localizacaoRegiao varchar(60)
);

-- Produto (PK: codProduto)
CREATE TABLE Produto(
	PRIMARY KEY (codProduto),
	codProduto int IDENTITY,
	nomeProduto varchar(60),
	valorProduto int,
	estoqueProduto int
);


-- Cliente (PK: codCliente)
CREATE TABLE Cliente(
	PRIMARY KEY (codCliente),
	codCliente int IDENTITY,
	nomeCliente varchar(60),
	foneCliente varchar(15),
    dataAniversario date,
    cpfCliente varchar(15)
);

-- ModeloVeiculo (PK: codModeloVeiculo)
CREATE TABLE ModeloVeiculo(
    PRIMARY KEY (codModeloVeiculo),
    codModeloVeiculo int IDENTITY,
    descricaoModelo varchar(60)
);

-- Veiculo (PK: codVeiculo / FK: codModeloVeiculo)
CREATE TABLE Veiculo(
	PRIMARY KEY (codVeiculo),
    FOREIGN KEY (codModeloVeiculo) REFERENCES ModeloVeiculo,
	codVeiculo int IDENTITY,
	codModeloVeiculo int,
	descricaoModelo varchar(60),
	placaVeiculo varchar(8)
);

-- TipoFone (PK: CodTipoFone)
CREATE TABLE TipoFone(
    PRIMARY KEY (CodTipoFone),
    CodTipoFone int IDENTITY,
    descricaoTipoFone varchar(20)
);

-- Telefone (PK: codTelefone / FK: codCliente & TipoFone)
CREATE TABLE Telefone(
    FOREIGN KEY (codCliente) REFERENCES Cliente,
    FOREIGN KEY (CodTipoFone) REFERENCES TipoFone,
    CodTipoFone int,
	CodCliente int,
    numeroTelefone varchar(15)
);

-- PontoEstrategico (FK: codRegiao)
CREATE TABLE PontoEstrategico(
    FOREIGN KEY (codRegiao) REFERENCES Regiao,
    codRegiao int,
    nomePontoEst varchar(60),
    descricaoPontoEst varchar(60)
);

-- Vendedor (PK: codVendedor / FK: codRegiao & codVeiculo)
CREATE TABLE Vendedor(
    PRIMARY KEY (codVendedor),
    FOREIGN KEY (codVeiculo) REFERENCES Veiculo,
    FOREIGN KEY (codRegiao) REFERENCES Regiao,
    codVeiculo int,
    codRegiao int,
    codVendedor int IDENTITY,
	nomeVendedor varchar(60)
);

-- AtribuicaoVeiculoVendedor
CREATE TABLE AtribuicaoVeiculoVendedor(
    PRIMARY KEY (codAtribuicao),
    FOREIGN KEY (codVeiculo) REFERENCES Veiculo,
    FOREIGN KEY (codVendedor) REFERENCES Vendedor,
    codAtribuicao int IDENTITY,
    codVeiculo int,
    codVendedor int,
    dataAtribuicao date
);

-- NotaFiscal (PK: codNotaFiscal / FK: codVendedor & codCliente)
CREATE TABLE NotaFiscal(
    PRIMARY KEY (codNotaFiscal),
    FOREIGN KEY (codVendedor) REFERENCES Vendedor,
    FOREIGN KEY (codCliente) REFERENCES Cliente,
    codNotaFiscal int IDENTITY,
	codVendedor int,
	codCliente int,
);

-- DescricaoNota (FK: codProduto & codNotaFiscal)
CREATE TABLE DescricaoNota(
    FOREIGN KEY (codNotaFiscal) REFERENCES NotaFiscal,
    FOREIGN KEY (codProduto) REFERENCES Produto,
	codNotaFiscal int,
	codProduto int,
    descricaoNota varchar(150)
);

-- Inserção de dados nas tabelas:

-- Região
INSERT INTO Regiao (nomeRegiao, descricaoRegiao, localizacaoRegiao)
VALUES
('São Miguel', 'Bairro', 'São Paulo'),
('Campinas', 'Interior', 'São Paulo'),
('Tucuruvi', 'Zona Norte', 'São Paulo'),
('Centro', 'Centro', 'Rio de Janeiro'),
('Santo Amaro', 'Subúrbio', 'Salvador'),
('Copacabana', 'Litoral', 'Rio de Janeiro');
select * from Regiao;

-- Produto
INSERT INTO Produto (nomeProduto, valorProduto, estoqueProduto)
VALUES
('Batom', 10, 1000),
('Esmalte', 5, 500),
('Shampoo', 8, 800),
('Condicionador', 7, 600),
('Perfume', 20, 300),
('Lápis de olho', 4, 1200);
select * from Produto;

-- Cliente
INSERT INTO Cliente (nomeCliente, foneCliente, dataAniversario, cpfCliente)
VALUES
('Danilo', '(11) 91326-2429', '01/08/2005', '549.828.235-08'),
('Maria', '(21) 98765-4321', '1990-03-15', '123.456.789-00'),
('João', '(71) 55555-1212', '1985-11-20', '987.654.321-01'),
('Ana', '(11) 5555-5555', '1995-07-10', '111.222.333-44'),
('Carlos', '(21) 1234-5678', '1980-04-05', '555.666.777-88'),
('Paula', '(71) 9999-8888', '2002-09-30	', '777.888.999-00');
select * from Cliente;

-- Modelo do Veículo
INSERT INTO ModeloVeiculo (descricaoModelo)
VALUES
('Palio'),
('Gol'),
('Celta'),
('Fiesta'),
('Civic'),
('Corolla');
select * from ModeloVeiculo;

-- Veículo
INSERT INTO Veiculo (codModeloVeiculo, descricaoModelo, placaVeiculo)
VALUES
(1, 'Vermelho', 'ADM-1234'),
(2, 'Branco', 'XYZ-5678'),
(3, 'Preto', 'ABC-9876'),
(4, 'Azul', 'QWE-4567'),
(5, 'Prata', 'JKL-7890'),
(6, 'Prata', 'MNO-1234');
select * from Veiculo;

-- Tipo do telefone
INSERT INTO TipoFone (descricaoTipoFone)
VALUES
('Celular'),
('Telefone fixo'),
('Comercial');
select * from TipoFone;

-- Telefone
INSERT INTO Telefone (CodCliente, CodTipoFone, numeroTelefone)
VALUES
(1, 1, '(11) 1234-21345'),
(2, 1, '(21) 9876-5432'),
(3, 1, '(71) 5555-1212'),
(4, 1, '(11) 4444-4444'),
(5, 1, '(11) 2054-2880'),
(6, 1, '(11) 2059-6598');
select * from Telefone;

-- Ponto estratégico
INSERT INTO PontoEstrategico (codRegiao, nomePontoEst, descricaoPontoEst)
VALUES
(1, 'Lojas Casas Bahia', 'Avenida Marechal Tito'),
(2, 'Supermercado ABC', 'Avenida Central'),
(3, 'Farmácia Pague Menos', 'Rua Principal'),
(4, 'Loja de Conveniência', 'Praça da República'),
(5, 'Posto de Gasolina', 'Avenida da Independência'),
(6, 'Shopping Center', 'Centro Comercial');
select * from PontoEstrategico;

-- Vendedor
INSERT INTO Vendedor (codVeiculo, codRegiao, nomeVendedor)
VALUES
(1, 1, 'Daniel'),
(2, 2, 'Guilherme'),
(3, 3, 'Gabriel'),
(4, 4, 'Gustavo'),
(5, 5, 'Nicolas'),
(6, 6, 'Lucas');
select * from Vendedor;

-- Atribuição de um veículo ao vendedor
INSERT INTO AtribuicaoVeiculoVendedor (codVeiculo, codVendedor, dataAtribuicao)
VALUES
(1, 1, '2010-02-01'),
(2, 2, '2011-05-15'),
(3, 3, '2012-08-20'),
(4, 4, '2013-11-25'),
(5, 5, '2014-06-10'),
(6, 6, '2015-09-15');
select * from AtribuicaoVeiculoVendedor;

-- Nota Fiscal
INSERT INTO NotaFiscal (codVendedor, codCliente)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);
select * from NotaFiscal;

-- Descrição da nota fiscal
INSERT INTO DescricaoNota (codNotaFiscal, codProduto, descricaoNota)
VALUES
(1, 1, 'Débito'),
(2, 3, 'Crédito'),
(3, 2, 'Débito'),
(4, 4, 'Crédito'),
(5, 5, 'Débito'),
(6, 6, 'Crédito');
select * from DescricaoNota;

-- Exercícios:

-- A) Listar todos os pontos estratégicos de cada região
SELECT nomeRegiao as Regiao, nomePontoEst as Ponto
FROM  PontoEstrategico inner join Regiao
ON Regiao.codRegiao = PontoEstrategico.codRegiao;

-- B) Listar os nomes das regiões cadastradas
SELECT nomeRegiao as Regiao
FROM Regiao;

-- C) Listar todos os vendedores e quais veículos que eles utilizaram no ultimo mês
SELECT nomeVendedor as Vendedor, ModeloVeiculo.descricaoModelo as Veiculo, AtribuicaoVeiculoVendedor.dataAtribuicao as Data_Atribuicao
FROM Vendedor inner join Veiculo
ON Vendedor.codVeiculo = Veiculo.codVeiculo
inner join AtribuicaoVeiculoVendedor
ON Vendedor.codVendedor = AtribuicaoVeiculoVendedor.codVendedor
inner join ModeloVeiculo
ON Veiculo.codModeloVeiculo = ModeloVeiculo.codModeloVeiculo
where dataAtribuicao ????

-- D) Listar todos os vendedores responsáveis por cada região


-- E) Todos os produtos vendidos por um determinado vendedor


-- F) Todos os vendedores que venderam determinado produto


-- G) Todos os produtos que ainda não foram vendidos


-- H) Listar o histórico de utilização de um determinado veículo


-- I) A quantidade de itens de cada nota fiscal
