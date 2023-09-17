CREATE DATABASE Vendas;
DROP DATABASE Vendas;
USE Vendas;

-- TABELAS ---x---x---x---x---x---x---x---x---x 
CREATE TABLE TBL_Estado_Civil(
	PRIMARY KEY (cod_est_civ),
	cod_est_civ int IDENTITY,
	desc_est_civ varchar(20),
);

CREATE TABLE TBL_cliente(
	PRIMARY KEY (cod_cliente),
	cod_cliente int IDENTITY,
	FOREIGN KEY (cod_est_civ) REFERENCES TBL_Estado_Civil,
	cod_est_civ int,
	nome_cliente varchar(60),
	salario int,
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
	numero_fone varchar(15),
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

-- INSERTS ---x---x---x---x---x---x---x---x---x 
insert into TBL_Estado_Civil (desc_est_civ) 
values
('Solteiro'),
('Casado'),
('Divorciado'),
('Viúvo');

insert into TBL_cliente (nome_cliente, salario) 
values 
('Danilo', 1000);

insert into TBL_Tipo_Fone (desc_fone)
values
('Telefone Fixo'),
('Celular');

insert into TBL_Produto (nome_produto, tipo_produto)
values
('Produto 1', 'Brinquedo');

insert into TBL_Func (nome_func) 
values 
('Francisco');

insert into TBL_Dependente (cod_func, nome_dep, data_nasc)
values
(1, 'Raimundo', '01/08/1995');

insert into TBL_Premio (cod_func, valor_premio)
values
(1, 1000);

insert into TBL_Conjuge (cod_cliente, nome)
values
(1, 'Luana');

insert into TBL_Telefone (cod_cliente, cod_fone, numero)
values
(1, 2, '(11) 12345-1234');

insert into TBL_Pedido (data_pedido) 
values 
('10/01/2002');

insert into TBL_Item_Pedido (cod_pedido, cod_produto, qtde_produto)
values
(1, 1, 4);

-- EXERCÍCIOS ---x---x---x---x---x---x---x---x---x 

-- Selecione o nome dos clientes e o numero de todos os telefones que cada cliente possui:
select TBL_cliente.nome_cliente as Nome, TBL_Telefone.numero_fone as Numero
from TBL_cliente inner join TBL_Telefone
on TBL_cliente.cod_cliente = TBL_Telefone.cod_cliente;

-- Selecione o nome dos clientes casados e o nome de seus cônjuges:
select TBL_cliente.nome_cliente as Cliente, TBL_Conjuge.nome_conjuge as Conjuge
from TBL_cliente inner join TBL_Conjuge
on TBL_cliente.cod_cliente = TBL_Conjuge.cod_cliente;

-- Selecione o nome dos clientes, o numero e o tipo de telefone que cada um possui:
select TBL_cliente.nome_cliente as Cliente, TBL_Telefone.numero_fone as Numero, TBL_Tipo_fone.desc_fone as Tipo
from TBL_cliente inner join TBL_Telefone
on TBL_cliente.cod_cliente = TBL_Telefone.cod_cliente
inner join TBL_Tipo_fone
on TBL_Telefone.cod_fone = TBL_Tipo_fone.cod_fone;

-- Selecione todas as colunas da tabela pedido, o nome do cliente que fez o pedido e o nome do funcionário que atendeu cada pedido:
select TBL_cliente.nome_cliente as Cliente, TBL_Pedido.*, TBL_Func.nome_func as Funcionario
from TBL_cliente inner join TBL_Pedido
on TBL_cliente.cod_cliente = TBL_Pedido.cod_cliente
inner join TBL_Func
on TBL_Pedido.cod_func = TBL_Func.cod_func;

-- Selecione o código e a data do pedido, o nome do cliente que fez o pedido do funcionário “Francisco”:
select TBL_Pedido.cod_pedido as Codigo, TBL_Pedido.data_pedido, TBL_cliente.nome_cliente
from TBL_Pedido inner join TBL_cliente
on TBL_Pedido.cod_cliente = TBL_cliente.cod_cliente
inner join TBL_Func
on TBL_Pedido.cod_func = TBL_Func.cod_func
where nome_func like 'Francisco';