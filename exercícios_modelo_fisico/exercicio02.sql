-- create schema if not exists exercicio02_corrigido default character set utf8mb4;
-- use exercicio02_corrigido;

-- create table if not exists passageiro (
-- cod_passageiro varchar(15) primary key,
-- nome varchar(20) not null,
-- sobrenome varchar(50) not null,
-- data_nasc date not null,
-- nacionalidade varchar(45) not null
-- );

-- create table if not exists reserva_de_voo (
-- cod_reserva int primary key,
-- data_reserva date not null,
-- forma_de_pagamento varchar(10) not null,
-- valor_total decimal(10,2) not null
-- );

-- create table if not exists cia_aerea (
-- id_cia int primary key,
-- nome varchar(50) not null,
-- CNPJ varchar(45) not null
-- );

-- create table if not exists aeronave (
-- cod_aeronave int primary key,
-- modelo varchar(45) not null,
-- fabricante varchar(45) not null,
-- ano year not null,
-- quant_assentos int not null,
-- cia_aerea_id_cia int not null,
-- constraint cia_aerea_aeronave foreign key(cia_aerea_id_cia) references cia_aerea(id_cia)
-- );

-- create table if not exists aeroporto (
-- cod_aeroporto varchar(15) primary key,
-- nome varchar(15) not null
-- );

-- create table if not exists endereco (
-- cep int not null,
-- rua varchar(100) not null,
-- numero int,
-- bairro varchar(50) not null,
-- cidade varchar(50) not null,
-- UF char(2),
-- complemento varchar(200),
--aeroporto_cod_aeroporto varchar(15) not null,
-- constraint aeroporto_cod_aeroporto foreign key(aeroporto_cod_aeroporto) references aeroporto(cod_aeroporto)
-- );

-- create table if not exists passageiros_reservas (
-- passageiro_cod_passageiro varchar(15),
-- reserva_cod_reserva int,
-- primary key(passageiro_cod_passageiro, reserva_cod_reserva),

-- constraint passageiro_cod_passageiro foreign key (passageiro_cod_passageiro) references passageiro(cod_passageiro),
-- constraint reserva_cod_reserva foreign key(reserva_cod_reserva) references reserva_de_voo(cod_reserva)
-- );

-- create table if not exists voos (
-- id_voo int primary key,
-- assento varchar(15) not null,
--data_de_partida date not null,
-- horario_de_partida time not null,
-- horario_de_cehgada time not null,

-- aeronave_id_aeronave int not null,
-- aeroporto_partida varchar(15) not null,
-- aeroporto_de_chegada varchar(15) not null,
-- cia_aera_cod_id int not null,

-- constraint aeronave_id_aeronave foreign key(aeronave_id_aeronave) references aeronave(cod_aeronave),
-- constraint aeroporto_partida foreign key(aeroporto_partida) references aeroporto(cod_aeroporto),
-- constraint aeroporto_de_chegada foreign key(aeroporto_de_chegada) references aeroporto(cod_aeroporto),
-- constraint cia_aera_cod_id foreign key(cia_aera_cod_id) references cia_aerea(id_cia)

-- );

-- create table if not exists voos_reserva (
-- voos_id_voos int,
-- voos_cod_reserva int,
-- primary key(voos_id_voos, voos_cod_reserva),
-- constraint voos_id_voos foreign key(voos_id_voos) references voos(id_voo),
-- constraint voos_cod_reserva foreign key(voos_cod_reserva) references reserva_de_voo(cod_reserva)
-- );

-- insert into passageiro (cod_passageiro, nome, sobrenome, data_nasc, nacionalidade) values
-- ("AAAAAAAAAAAAAA1", "CARLOS HENRIQUE", "SANTOS PAZINI", "2005-06-18", "BRASIL"),
-- ("AAAAAAAAAAAAAA2", "FERNANDO", "SANTOS", "2004-06-25", "URUGUAI");

-- insert into reserva_de_voo (cod_reserva, data_reserva, forma_de_pagamento,valor_total) values 
-- 001, "2024-05-01", "PIX", 250.00),
-- (002, "2024-05-05", "CARTÃO", 530.20);

--  insert into cia_aerea (id_cia, nome, CNPJ) values 
-- (001, "LATAM", "11.111.111/0001-00"),
-- (002, "GOL", "22.222.222/0002-00");

-- insert into aeronave (cod_aeronave, modelo, fabricante, ano, quant_assentos, cia_aerea_id_cia) values 
-- (001, "BOEING 707", "BOEING", "2009", 300, 001),
-- (002, "BOEING 808", "BOEING", "2015", 350, 002);

-- insert into aeroporto (cod_aeroporto, nome) values 
-- (001, "AEROPASS"),
-- (002, "DECOL");

-- insert into endereco (cep, rua, numero, bairro, cidade, UF, complemento, aeroporto_cod_aeroporto) values
-- (2009160, "JAJAJA PEPEPE", 12, "XAXAXAXA", "CACACA", "SP", "AO LADO SO SHOPPING", 001),
-- (2007160, "EUEUE NANANA", 20, "VAVAVAVA", "PAPAPAPA", "RJ", "AO LADO DA PRAIA", 002)

-- insert into passageiros_reservas (passageiro_cod_passageiro, reserva_cod_reserva) values 
-- ("AAAAAAAAAAAAAA1", 001),
-- ("AAAAAAAAAAAAAA2", 002);

-- insert into voos (id_voo, assento, data_de_partida, horario_de_partida, horario_de_cehgada,
-- aeronave_id_aeronave,  aeroporto_partida, aeroporto_de_chegada, cia_aera_cod_id) values 
-- (001, "L15", "2024-05-09", "10:00:00", "23:00:00", 001, 001, 002, 001),
-- (002, "R20", "2024-05-20", "05:30:00", "18:30:00", 002, 002, 001, 002);
 
 -- insert into voos_reserva (voos_id_voos, voos_cod_reserva) values 
 -- (001, 001),
 -- (002, 002);
 
-- selecionando os dados da tabela
select * from passageiro;
select * from reserva_de_voo;
select * from cia_aerea;
select * from aeronave;
select * from aeroporto;
select * from endereco;
select * from passageiros_reservas;
select * from voos;
select * from voos_reserva;
