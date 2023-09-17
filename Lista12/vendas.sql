CREATE DATABASE Vendas;
USE Vendas;

-- TABELAS
CREATE TABLE TBL_Estado_Civil(
	PRIMARY KEY (cod_est_civ),
	cod_est_civ int IDENTITY,
	desc_est_civ varchar(20),
);

CREATE TABLE TBL_Tipo_fone(
	PRIMARY KEY (cod_fone),
	cod_fone int IDENTITY,
	desc_fone varchar(20),
);

CREATE TABLE TBL_Produto(
	PRIMARY KEY (cod_produto),
	cod_produto int IDENTITY,
	nome_produto varchar(60),
	tipo_produto varchar(60),
);

CREATE TABLE TBL_Func (
	PRIMARY KEY (cod_func),
	cod_func int IDENTITY,
	nome_func varchar(60),
);

CREATE TABLE TBL_Dependente(
	PRIMARY KEY (cod_dep),
	cod_dep int IDENTITY,
	nome_dep varchar(60),
	data_nasc date,
	FOREIGN KEY (cod_func) REFERENCES TBL_Func,
	cod_func int,
);

CREATE TABLE TBL_Premio(
	FOREIGN KEY (cod_func) REFERENCES TBL_Func,
	cod_func int,
	valor_premio int,
);

CREATE TABLE TBL_cliente(
	PRIMARY KEY (cod_cliente),
	cod_cliente int IDENTITY,
	nome_cliente varchar(60),
	FOREIGN KEY (cod_est_civ) REFERENCES TBL_Estado_Civil,
	cod_est_civ int,
	salario int,
);

CREATE TABLE TBL_Conjuge(
	PRIMARY KEY (cod_conjuge),
	cod_conjuge int IDENTITY,
	nome_conjuge varchar(60),
	FOREIGN KEY (cod_cliente) REFERENCES TBL_Cliente,
	cod_cliente int,
);

CREATE TABLE TBL_Telefone(
	FOREIGN KEY (cod_cliente) REFERENCES TBL_Cliente,
	cod_cliente int,
	FOREIGN KEY (cod_fone) REFERENCES TBL_Tipo_Fone,
	cod_fone int,
	numero_fone int,
);

CREATE TABLE TBL_Pedido(
	PRIMARY KEY (cod_pedido),
	cod_pedido int IDENTITY,
	FOREIGN KEY (cod_cliente) REFERENCES TBL_Cliente,
	cod_cliente int,
	FOREIGN KEY (cod_func) REFERENCES TBL_Func,
	cod_func int,
	data_pedido date,
);

CREATE TABLE TBL_Item_Pedido(
	FOREIGN KEY (cod_pedido) REFERENCES TBL_Pedido,
	cod_pedido int,
	FOREIGN KEY (cod_produto) REFERENCES TBL_Produto,
	cod_produto int,
	qtde_produto int
);

