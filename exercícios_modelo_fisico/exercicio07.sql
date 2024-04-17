create schema if not exists fianaceiro default character set utf8mb4;
use fianaceiro;

create table if not exists usuarios (
id int primary key,
nome_completo varchar(45) not null,
CPF varchar(15) not null,
email varchar(45) not null,
telefone varchar(20) not null,
data_nasc date not null
);

create table if not exists transacoes (
id int primary key,
valor decimal(10,2),
natureza varchar(10),
usuario_id int not null,
constraint usuario_id_transacoes foreign key(usuario_id) references usuarios(id)
);

-- fique na duvida se bancos realmente vai para uma tabela à parte 
create table if not exists  bancos (
cod int primary key,
nome varchar(45) not null
);

create table if not exists agencias (
cod varchar(10) primary key,
email varchar(50) not null,
telefone varchar(20) not null
);

create table if not exists endereco_agencia (
agencia_cod varchar(10) not null,
logradouro varchar(100) not null,
bairro varchar(50) not null,
cidade varchar(50) not null,
UF char(2) not null,
constraint agencia_cod_endereco_agencia foreign key(agencia_cod) references agencias(cod)
);

create table if not exists contas (
num_conta varchar(15) primary key,
tipo varchar(10) not null,
usuario_id int not null,
transacao_id int,
banco_cod int not null,
agencia_cod varchar(10) not null,
constraint usuario_id_contas foreign key(usuario_id) references usuarios(id), 
constraint transacao_id_contas foreign key(transacao_id) references transacoes(id),
-- a fk banco_cod está aqui para poder refenciar a qual banco a conta pertence
constraint banco_cod_contas foreign key(banco_cod) references bancos(cod),
constraint agencia_cod_contas foreign key(agencia_cod) references agencias(cod)
);
 
create table if not exists saldos (
data_saldo date not null,
valor decimal(10,2) not null,
conta_num_conta varchar(15) not null,
constraint conta_num_conta_saldos foreign key(conta_num_conta) references contas(num_conta)
);

