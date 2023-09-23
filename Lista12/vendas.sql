CREATE DATABASE Vendas;
DROP DATABASE Vendas;
USE Vendas;
USE master;

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
	numero_fone varchar(15) null,
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

insert into TBL_cliente (nome_cliente, salario, cod_est_civ) 
values 
('Rener', 1000, 2),
('Daniel', 1000, 1),
('Luan', 2000, 3);

insert into TBL_Tipo_Fone (desc_fone)
values
('Telefone Fixo'),
('Celular');

insert into TBL_Produto (nome_produto, tipo_produto)
values
('Fósforo', 'Utilidade doméstica'),
('Sal', 'Tempero');

insert into TBL_Func (nome_func) 
values 
('Francisco'),
('Roseane');

insert into TBL_Dependente (cod_func, nome_dep, data_nasc)
values
(1, 'Raimundo', '01/08/1995');

insert into TBL_Premio (cod_func, valor_premio)
values
(1, 1000);

insert into TBL_Conjuge (cod_cliente, nome_conjuge)
values
(1, 'Luana');

insert into TBL_Telefone (cod_cliente, cod_fone, numero_fone)
values
(1, 2, '(11) 12345-1234'),
(1, 1, '20542808');

insert into TBL_Pedido (cod_cliente, cod_func, data_pedido) 
values 
(1, 1, '10/01/2002'),
(2, 2, '10/01/2006'),
(2, 2, '10/01/2009');

insert into TBL_Item_Pedido (cod_pedido, cod_produto, qtde_produto)
values
(1, 1, 4),
(2, 1, 2),
(3, 1, 2);

-- EXERCÍCIOS Parte 1 ---x---x---x---x---x---x---x---x---x

-- 1 Selecione o nome dos clientes e o numero de todos os telefones que cada cliente possui:
select TBL_cliente.nome_cliente as Nome, TBL_Telefone.numero_fone as Numero
from TBL_cliente inner join TBL_Telefone
on TBL_cliente.cod_cliente = TBL_Telefone.cod_cliente;

-- 2 Selecione o nome dos clientes casados e o nome de seus cônjuges:
select TBL_cliente.nome_cliente as Cliente, TBL_Conjuge.nome_conjuge as Conjuge
from TBL_cliente inner join TBL_Conjuge
on TBL_cliente.cod_cliente = TBL_Conjuge.cod_cliente
where cod_est_civ=2;

-- 3 Selecione o nome dos clientes, o numero e o tipo de telefone que cada um possui:
select TBL_cliente.nome_cliente as Cliente, TBL_Telefone.numero_fone as Numero, TBL_Tipo_fone.desc_fone as Tipo
from TBL_cliente inner join TBL_Telefone
on TBL_cliente.cod_cliente = TBL_Telefone.cod_cliente
inner join TBL_Tipo_fone
on TBL_Telefone.cod_fone = TBL_Tipo_fone.cod_fone;

-- 4 Selecione todas as colunas da tabela pedido, o nome do cliente que fez o pedido e o nome do funcionário que atendeu cada pedido:
select TBL_cliente.nome_cliente as Cliente, TBL_Pedido.*, TBL_Func.nome_func as Funcionario
from TBL_cliente inner join TBL_Pedido
on TBL_cliente.cod_cliente = TBL_Pedido.cod_cliente
inner join TBL_Func
on TBL_Pedido.cod_func = TBL_Func.cod_func;

-- 5 Selecione o código e a data do pedido, o nome do cliente que fez o pedido do funcionário “Francisco”:
select TBL_Pedido.cod_pedido as Codigo, TBL_Pedido.data_pedido, TBL_cliente.nome_cliente
from TBL_Pedido inner join TBL_cliente
on TBL_Pedido.cod_cliente = TBL_cliente.cod_cliente
inner join TBL_Func
on TBL_Pedido.cod_func = TBL_Func.cod_func
where nome_func like 'Francisco';

-- EXERCÍCIOS Parte 2 ---x---x---x---x---x---x---x---x---x

-- 6 Selecione o código e a data do pedido, o nome do funcionário que atendeu o pedido do cliente “Rener”:
select TBL_Pedido.cod_pedido as Codigo, TBL_Pedido.data_pedido as Data, TBL_Func.nome_func as Funcionario
from TBL_Pedido inner join TBL_Func
on TBL_Pedido.cod_func = TBL_Func.cod_func
inner join TBL_cliente
on TBL_Pedido.cod_cliente = TBL_cliente.cod_cliente
where TBL_cliente.nome_cliente like 'Rener';

-- 7 Mostre o nome e a data de nascimento dos dependentes de cada funcionário:
select TBL_Func.nome_func as Funcionario, TBL_Dependente.nome_dep as Dependente, TBL_Dependente.data_nasc as DataDependente
from TBL_Func inner join TBL_Dependente
on TBL_Func.cod_func = TBL_Dependente.cod_func

-- 8 Selecione o código e a data do pedido e o nome de cada produto vendido:
select TBL_Produto.nome_produto as Produto, TBL_Pedido.cod_pedido as Cod, TBL_Pedido.data_pedido as DataPedido
from TBL_Produto inner join TBL_Pedido
on TBL_Pedido.cod_pedido = TBL_Pedido.cod_pedido

-- 9 Selecione o código e a data do pedido e o nome de funcionário que vendeu “Fosforo”:
select TBL_Pedido.cod_pedido as Codigo, TBL_Pedido.data_pedido as DataPedido, TBL_Func.nome_func as Funcionario
from TBL_Pedido inner join TBL_Func
on TBL_Pedido.cod_func = TBL_Func.cod_func
inner join TBL_Item_Pedido
on TBL_Pedido.cod_pedido = TBL_Item_Pedido.cod_pedido
inner join TBL_Produto
on TBL_Item_Pedido.cod_produto = TBL_Pedido.cod_pedido
where TBL_Produto.nome_produto like 'Fósforo';

-- 10 - Selecione o código e a data do pedido e o nome dos produtos comprados pelo cliente “Daniel”:
select TBL_Pedido.cod_pedido as Codigo, TBL_Pedido.data_pedido as DataPedido, TBL_Produto.nome_produto as Produto
from TBL_Pedido inner join TBL_Item_Pedido
on TBL_Pedido.cod_pedido = TBL_Item_Pedido.cod_pedido
inner join TBL_cliente
on TBL_Pedido.cod_cliente = TBL_cliente.cod_cliente
inner join TBL_Produto
on TBL_Item_Pedido.cod_produto = TBL_Produto.cod_produto
where TBL_cliente.nome_cliente like 'Daniel';

-- 11 Selecione todos os produtos vendidos pela funcionária “Roseane”:
select TBL_Produto.nome_produto as Produto, TBL_Func.nome_func as Funcionaria
from TBL_Produto inner join TBL_Item_Pedido
on TBL_Produto.cod_produto = TBL_Item_Pedido.cod_produto
inner join TBL_Pedido
on TBL_Item_Pedido.cod_produto = TBL_Produto.cod_produto
inner join TBL_Func
on TBL_Pedido.cod_func = TBL_Func.cod_func
where TBL_Func.nome_func like 'Roseane';

-- 12 Selecione o nome dos clientes e o nome dos produtos comprados respectivamente:
select TBL_cliente.nome_cliente as Cliente, TBL_Produto.nome_produto as Produto
from TBL_cliente inner join TBL_Pedido
on TBL_cliente.cod_cliente = TBL_Pedido.cod_cliente
inner join TBL_Item_Pedido
on TBL_Pedido.cod_pedido = TBL_Item_Pedido.cod_pedido
inner join TBL_Produto
on TBL_Item_Pedido.cod_produto = TBL_Produto.cod_produto;

-- 13 Selecione o nome dos funcionários e o nome dos produtos vendidos respectivamente:
select TBL_Func.nome_func as Funcionario, TBL_Produto.nome_produto as Produto
from TBL_Func inner join TBL_Pedido
on TBL_Func.cod_func = TBL_Pedido.cod_func
inner join TBL_Item_Pedido
on TBL_Pedido.cod_pedido = TBL_Item_Pedido.cod_pedido
inner join TBL_Produto
on TBL_Item_Pedido.cod_produto = TBL_Produto.cod_produto;

-- EXERCÍCIOS Parte 3 ---x---x---x---x---x---x---x---x---x

-- -- -- Group by -- -- --

-- 14 Mostre o nome dos funcionários e o valor total dos prêmios que cada funcionário tem:
select TBL_Func.nome_func as Funcionario, sum(TBL_Premio.valor_premio) as TotalPremio
from TBL_Func inner join TBL_Premio
on TBL_Func.cod_func = TBL_Premio.cod_func
group by nome_func;

-- 15 Mostre o nome dos funcionários e quantidade de dependentes de cada funcionário:
select TBL_Func.nome_func as Funcionario, count(TBL_Dependente.cod_dep) as QuantidadeDependente
from TBL_Func inner join TBL_Dependente
on TBL_Func.cod_func = TBL_Dependente.cod_func
group by nome_func;

-- 16 Mostre a quantidade de clientes “Casados”, “Solteiros” e “Separados”:
select TBL_Estado_Civil.desc_est_civ as EstadoCivil, count(TBL_cliente.nome_cliente) as TotalClientes
from TBL_cliente inner join TBL_Estado_Civil
on TBL_cliente.cod_est_civ = TBL_Estado_Civil.cod_est_civ
group by desc_est_civ;

-- -- -- SubQuery -- -- --

-- 17 Selecione os dados dos clientes que não tem telefone:
select *
from TBL_cliente
where cod_cliente not in (select distinct cod_cliente from TBL_Telefone);

-- 18 Selecione os dados dos clientes “Solteiros”:
select TBL_Estado_Civil.desc_est_civ as EstadoCivil, TBL_cliente.*
from TBL_cliente inner join TBL_Estado_Civil
on TBL_cliente.cod_est_civ = TBL_Estado_Civil.cod_est_civ
where TBL_Estado_Civil.cod_est_civ = 1;

-- 19 Selecione os dados dos clientes “Casados”:
select TBL_Estado_Civil.desc_est_civ as EstadoCivil, TBL_cliente.*
from TBL_cliente inner join TBL_Estado_Civil
on TBL_cliente.cod_est_civ = TBL_Estado_Civil.cod_est_civ
where TBL_Estado_Civil.cod_est_civ = 2;

-- 20 Selecione os dados dos funcionários que não têm prêmios:
select *
from TBL_Func
where cod_func not in (select distinct cod_func from TBL_Premio);

-- 21 Selecione os dados dos funcionários que não têm dependentes:
select *
from TBL_Func
where cod_func not in (select distinct cod_func from TBL_Dependente);

-- 22 Selecione os produtos que nunca foram vendidos:
select *
from TBL_Produto left join TBL_Item_Pedido
on TBL_Produto.cod_produto = TBL_Item_Pedido.cod_produto
where TBL_Item_Pedido.cod_produto is null