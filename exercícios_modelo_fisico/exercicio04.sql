create schema if not exists e_comerce default character set utf8mb4;
use e_comerce;

create table if not exists produto(
id int primary key,
nome varchar(45) not null,
descrição text not null
);

create table if not exists fornecedores(
id int primary key,
CNPJ varchar(20) not null,
nome varchar(45) not null,
cidade varchar(45) not null
);

create table if not exists produtos_fornecedores(
produto_id int,
fornecedores_id int,
primary key(produto_id, fornecedores_id),
constraint ptoduto_id_fonecedores_id foreign key(produto_id) references produto(id),
constraint fornecedores_id_produto_id foreign key(fornecedores_id) references fornecedores(id)
);

create table if not exists pedido_compra(
id int primary key,
data_pedido datetime,
forncedor_id int not null,
constraint fornecedor_id_pedido_compra_id foreign key(forncedor_id) references fornecedores(id)
);

create table if not exists produto_pedidos_compra(
id_produto int,
id_pedido_compra int,
primary key(id_produto, id_pedido_compra),
constraint produto_id_pedidos_compra_id foreign key(id_produto) references produto(id),
constraint pedido_compra_id_porduto_id foreign key(id_pedido_compra) references pedido_compra(id)
);

create table if not exists armazen(
id int primary key,
nome varchar(45) not null,
logradouro varchar(45) not null,
numero int,
bairro varchar(45),
cidade varchar(45),
UF char(2)
);

create table if not exists produtos_armazen(
produto_id int,
armazen_id int,
primary key(produto_id, armazen_id),
constraint produto_id_armazen_id foreign key(produto_id) references produto(id),
constraint armazen_id_produto_id foreign key(armazen_id) references armazen(id)
);

