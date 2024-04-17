create schema if not exists rede_social_corrigido default character set utf8mb4;
use rede_social_corrigido;

create table if not exists usuario(
id int primary key,
nome varchar(45) not null,
sobrenome varchar(45) not null,
email varchar(50) not null
);

create table if not exists seguidor_seguido(
usuario_seguido int,
usuario_seguidor int,
primary key(usuario_seguido, usuario_seguidor),

constraint usuario_seguido foreign key(usuario_seguido) references usuario(id),
constraint usuario_seguidor foreign key(usuario_seguidor) references usuario(id)
);

create table if not exists grupo(
id int primary key,
nome varchar(45) not null,
descricao text not null
);

create table if not exists  usuario_grupo(
usuario_id int,
grupo_id int,
primary key(usuario_id, grupo_id),
constraint usuario_id_grupo_id foreign key(usuario_id) references usuario(id),
constraint grupo_id_usuario_id foreign key(grupo_id) references grupo(id)
);

create table if not exists postagem(
id int primary key,
texto text not null,
imagem blob not null,
data_hora datetime not null,
usuario_id int not null,
constraint usuario_id_postagem_id foreign key(usuario_id) references usuario(id)
);

create table if not exists comentario(
id int primary key,
texto text not null,
data_hora datetime not null,
usuario_id int not null,
postagem_id int not null,
constraint usuario_id_comentario_id foreign key(usuario_id) references usuario(id),
constraint postagem_id_comentario foreign key(postagem_id) references postagem(id)
);