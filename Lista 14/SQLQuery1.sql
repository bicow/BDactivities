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
	foneCliente varchar(60)
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

-- Fone (PK: codTelefone / FK: codCliente & TipoFone)
CREATE TABLE Telefone(
    FOREIGN KEY (codCliente) REFERENCES Cliente,
    FOREIGN KEY (CodTipoFone) REFERENCES TipoFone,
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
    codVendedor int IDENTITY    
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

INSERT INTO Clie