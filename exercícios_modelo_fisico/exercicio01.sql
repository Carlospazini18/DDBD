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

