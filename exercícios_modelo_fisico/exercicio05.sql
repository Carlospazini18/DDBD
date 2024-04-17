create schema if not exists EmpresEventos default character set utf8mb4;
use EmpresEventos;

create table if not exists participantes(
num_inscricao int primary key,
CPF varchar(9) not null,
nome varchar(45),
data_nasc date not null,
empresa varchar(45) not null
);

create table if not exists locais(
id int primary key,
nome varchar(45),
logradouro varchar(100),
numero int,
bairro varchar(45),
cidade varchar(45),
UF char(2),
cep varchar(8),
capacidade int not null
);

create table if not exists eventos(
id int primary key,
nome varchar(45) not null,
date_hora datetime not null,
entidade_promotora varchar(45),
local_id int not null,
constraint locais_id_eventos foreign key(local_id) references locais(id)
);

create table if not exists participantes_evento(
participante_num_inscricao int,
evento_id int,
primary key(participante_num_inscricao, evento_id),
constraint participante_num_inscricao_participantes_evento foreign key(participante_num_inscricao) references participantes(num_inscricao),
constraint evento_id_participantes_evento foreign key(evento_id) references eventos(id)
);

create table if not exists atividades(
id int primary key,
nome varchar(45) not null,
data_hora datetime not null,
evento_id int not null,
constraint evento_id_participantes_eventos foreign key(evento_id)references eventos(id)
);

create table if not exists participantes_atividades(
participante_num_inscricao int,
atividade_id int,
primary key(participante_num_inscricao, atividade_id),
constraint participante_num_inscricao_participantes_atividades foreign key(participante_num_inscricao) references participantes(num_inscricao),
constraint atividade_id_participantes_atividades foreign key(atividade_id) references atividades(id)
);