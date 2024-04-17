create schema if not exists cinema default character set utf8mb4;
use cinema;

create table if not exists espectadores(
cod int primary key,
telefone varchar(20) not null,
email varchar(45) not null,
nome varchar(50) not null,
data_nasc date not null
);

create table if not exists ingressos(
id int primary key,
data_ingresso date not null,
hora_ingresso time not null,
espectador_cod int not null,
constraint espectador_cod_ingressos foreign key(espectador_cod) references espectadores(cod)
);

create table if not exists sala(
numero int primary key,
nome varchar(45)not null,
capacidade int not null
);

create table if not exists filmes(
id int primary key,
nome varchar(45) not null,
tempo int not null,
diretor varchar(45)
);

create table if not exists seessoes(
id int primary key,
ingresso_id int not null,
sala_numero int not null,
filme_id int not null,
constraint ingresso_id_sessoes foreign key(ingresso_id) references ingressos(id),
constraint sala_numero_sessoes foreign key(sala_numero) references sala(numero),
constraint filme_id_sessoes foreign key(filme_id) references filmes(id)
);