-- Criação do banco de dados:
CREATE DATABASE IndustriaBeleza;
-- Abertua do banco
USE DATABASE IndustriBeleza;

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
    codModeloVeiculo int IDENTITY
    descricaoModelo varchar(60)
);

-- Veiculo (PK: codVeiculo / FK: codModeloVeiculo)
CREATE TABLE Veiculo(
	PRIMARY KEY (codVeiculo),
    FOREIGN KEY (codModeloVeiculo) REFERENCES ModeloVeiculo,
	codVeiculo int IDENTITY,
	descricaoModelo int,
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
    numeroTelefone varchar(15)
);

-- PontoEstrategico (FK: codRegiao)
CREATE TABLE PontoEstrategico(
    FOREIGN KEY (codRegiao),
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
    codVendedor int IDENTITY    
);

-- AtribuicaoVeiculoVendedor
CREATE TABLE AtribuicaoVeiculoVendedor(
    PRIMARY KEY (codAtribuicao),
    FOREIGN KEY (codVeiculo) REFERENCES Veiculo,
    FOREIGN KEY (codVendedor) REFERENCES Vendedor,
    codAtribuicao int IDENTITY,
    codVeiculo int,
    codCliente int,
    dataAtribuicao date
);

-- NotaFiscal (PK: codNotaFiscal / FK: codVendedor & codCliente)
CREATE TABLE NotaFiscal(
    PRIMARY KEY (codNotaFiscal),
    FOREIGN KEY (codVendedor) REFERENCES Vendedor,
    FOREIGN KEY (codCliente) REFERENCES Cliente,
    codNotaFiscal int IDENTITY,
);

-- DescricaoNota (FK: codProduto & codNotaFiscal)
CREATE TABLE DescricaoNota(
    FOREIGN KEY (codNotaFiscal) REFERENCES NotaFiscal,
    FOREIGN KEY (codProduto) REFERENCES Produto,
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

-- Produto
INSERT INTO Produto (nomeProduto, valorProduto, estoqueProduto)
VALUES
('Batom vermelho', 10, 1000),
('');

-- Cliente
INSERT INTO Cliente (nomeCliente, foneCliente, dataAniversario, cpfCliente)
VALUES
('Danilo', '(11) 91326-2429', '01/08/2005', '439.797.828-08'),
('');

-- Modelo do Veículo
INSERT INTO ModeloVeiculo (descricaoModelo)
VALUES
('Palio Weekend'),
('');

-- Veículo
INSERT INTO Veiculo (codModeloVeiculo, placaVeiculo)
VALUES
(1, 'ADM-1234'),
('');

-- Tipo do telefone
INSERT INTO TipoFone (descricaoTipoFone)
VALUES
('Celular'),
('Telefone fixo');

-- Telefone
INSERT INTO Telefone (CodTipoFone, numeroTelefone)
VALUES
(1, '(11) 1234-21345'),
('');

-- Produto
INSERT INTO Produto (nomeProduto, valorProduto, estoqueProduto)
VALUES
('Batom vermelho', 10, 1000),
('');

-- Ponto estratégico
INSERT INTO PontoEstrategico (codRegiao, nomePontoEst, descricaoPontoEst)
VALUES
(1, 'Loja Casas Bahia', 'Travessa da Avenida Marechal Tito'),
('');

-- Vendedor
INSERT INTO Vendedor (codVeiculo)
VALUES
(1, 'Loja Casas Bahia', 'Travessa da Avenida Marechal Tito'),
('');

-- Atribuição de um veículo ao vendedor
INSERT INTO AtribuicaoVeiculoVendedor (codVeiculo, codVendedor, dataAtribuicao)
VALUES
(1, 1, '01/02/2010'),
('');

-- Nota Fiscal
INSERT INTO NotaFiscal (codVendedor, codCliente)
VALUES
(1, 1),
('');

-- Descrição da nota fiscal
INSERT INTO descricaoNota (codNotaFiscal, codProduto, descricaoNota)
VALUES
(1, 1, 'Débito'),
('');