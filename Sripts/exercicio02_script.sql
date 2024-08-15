create table tb_usuario(
	id int primary key,
	nome varchar(20) not null,
	email varchar(20) unique,
	nascimento date,
	website varchar(20),
	genero char(1),
	telefone varchar(20),
	foto_de_perfil_id varchar(20)
	--foreign key (foto_de_perfil_id) references tb_foto(uri)
);

create table tb_seguidores(
	seguidor_id int,
	seguindo_id int,
	primary key (seguidor_id, seguindo_id),
	foreign key (seguidor_id) references tb_usuario(id),
	foreign key (seguindo_id) references tb_usuario(id)
);

create table tb_postagem(
	id int primary key,
	texto varchar(30),
	instante timestamp,
	autor_id int,
	foreign key (autor_id) references tb_usuario(id)
);

create table tb_album(
	id int primary key,
	titulo varchar(10),
	instante_de_postagem timestamp,
	usuario_id int,
	foreign key (usuario_id) references tb_usuario(id)
);

create table tb_foto(
	uri varchar(20) primary key,
	instante_de_postagem timestamp,
	postagem_id int,
	usuario_id int,
	album_id int,
	foreign key (postagem_id) references tb_postagem(id),
	foreign key (usuario_id) references tb_usuario(id),
	foreign key (album_id) references tb_album(id)
);

-- adicionando a chave estrangeira ao tb_usuario
alter table tb_usuario add foreign key (foto_de_perfil_id) references tb_foto(uri)

--seed database
insert into [dbo].tb_usuario([id],[nome],[email],[nascimento],[website],[genero],[telefone],[foto_de_perfil_id])
values(1,'João Silva', 'joao@gmail.com','1991-10-15','joao.com','m','999555',null);

insert into [dbo].tb_usuario([id],[nome],[email],[nascimento],[website],[genero],[telefone],[foto_de_perfil_id])
values(2,'Maria', 'maria@gmail.com','1991-05-15','maria.com','f','998855',null);

insert into [dbo].tb_seguidores([seguidor_id],[seguindo_id])
values(1,2);

insert into [dbo].tb_postagem([id],[texto],[instante],[autor_id])
values(1,'partiu festa',default,1);

insert into [dbo].tb_album([id],[titulo],[instante_de_postagem],[usuario_id])
values(1,'ferias',default,1);

insert into [dbo].tb_foto([uri],[instante_de_postagem],[postagem_id],[usuario_id],[album_id])
values('www.foto.com',default,null,1,1);
