create schema if not exists hospital default character set utf8mb4;
use hospital;

create table if not exists paciente(
cpf varchar(15) primary key,
nome varchar(45) not null,
data_nasc date not null,
telefone varchar(45) not null,
email varchar(40) not null
);

create table if not exists departamento(
cod_departamento int primary key,
nome_departamento varchar(45) not null
);

create table if not exists medico(
CRM int,
UF char(2),
nome varchar(45) not null,
email varchar(45) not null,
telefone varchar(45) not null,
medico_id_departamento int not null,
primary key(CRM, UF),
constraint medico_departamento_id foreign key(medico_id_departamento)
references departamento(cod_departamento)
);

create table if not exists consultas(
id_consulta int primary key,
anamnese text not null,
date_consulta date not null,
hora_consul time not null,
cpf_paciente_consulta varchar(15) not null,
CRM_medico_consulta int not null,
UF_medico_consulta char(2) not null,
constraint med_consulta foreign key(CRM_medico_consulta, UF_medico_consulta)
references medico(CRM, UF),
constraint cpf_paciente_consulta foreign key(cpf_paciente_consulta)
references paciente(cpf)
);

-- INSERINDO VALORES NAS TABELAS 

insert into paciente(cpf, nome, data_nasc, telefone, email)
values("111.111.111-22", "ΑΝΟΝ ΝΟΝΟΝΟΝ", "1970-12-24","+5527999991111","ANON@ANON.COM"),
("222.222.111-22","NONA NANANAN", "1990-05-01","+5527999992222", "NONA@ANON.COM"),
("333.333.111-22", "ΝΟΝΝΟ ΝΟΝΟΝΟΝ", "1985-02-28","+5527999993333","ΝΟΜNO@ANON.COM");

insert into departamento(cod_departamento, nome_departamento) 
values(001, "clínico geral"), (002, "gastroentereologista"), (003, "cardiologista");

insert into medico(CRM, UF, nome, email, telefone, medico_id_departamento) values 
(1023, "ES", "JESUINO TAMANDARE", "JESUTANAN@MEDICO.NET","+5527989898766", 001),
(1432, "RS", "BENTO GONÇALVES", "BENTOGON@MEDICO.NET", "45527998983766", 002),
(2123, "CE", "MARIA BONITA", "MARIABONITA@MEDICO.NET", " +5527984543543", 003);

insert into consultas (id_consulta, anamnese, date_consulta, hora_consul, cpf_paciente_consulta,
 CRM_medico_consulta, UF_medico_consulta) values 
(001, "PACIENTE INFARTOU", "2024-04-10", "15:41:00", "111.111.111-22", 1023, "ES"),
(002,"PACIENTE ESTÁ COM FEBRE","2024-04-10", "12:10:00", "333.333.111-22", 1432, "RS"),
(003, "PACIENTE INFARTOU", "2024-04-10", "15:41:00", "222.222.111-22", 2123, "CE");

-- SELECIONANDO AS TABELAS PARA MOSTRAREM OS DADOS

-- select * from consultas;
-- select * from medico;
-- select * from departamento;
-- select * from paciente;
