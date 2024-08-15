CREATE TABLE tb_categoria(
	id INT,
	descricao VARCHAR(20),
	PRIMARY KEY (id)
);

CREATE TABLE tb_atividade(
	id INT PRIMARY KEY,
	nome VARCHAR(20),
	descricao VARCHAR(20),
	preco FLOAT,
	categoria_id INT,
	FOREIGN KEY (categoria_id) REFERENCES tb_categoria(id)
);

CREATE TABLE tb_participante(
	id INT,
	nome VARCHAR(20),
	email VARCHAR(20),
	PRIMARY KEY (id)
);

CREATE TABLE tb_bloco(
	id INT PRIMARY KEY,
	inicio DATE,
	fim DATE,
	atividade_id INT,
	FOREIGN KEY (atividade_id) REFERENCES tb_atividade(id)
);

CREATE TABLE tb_participacao(
	participante_id INT,
	atividade_id INT,
	FOREIGN KEY (participante_id) REFERENCES tb_participante(id),
	FOREIGN KEY (atividade_id) REFERENCES tb_atividade(id)
);


--instanciar(seed database)

INSERT INTO [dbo].[tb_categoria]([id],[descricao])VALUES(1,'curso');
INSERT INTO [dbo].[tb_categoria]([id],[descricao])VALUES(2,'oficina');

INSERT INTO [dbo].[tb_atividade]([id],[nome],[descricao],[preco],[categoria_id])VALUES(1,'Curso de HTML','Aprenda HTML',80.0,1);
INSERT INTO [dbo].[tb_atividade]([id],[nome],[descricao],[preco],[categoria_id])VALUES(2,'Oficina de github','Aprenda github',50.0,2);

INSERT INTO [dbo].[tb_bloco]([id],[inicio],[fim],[atividade_id])VALUES(1,'2017-09-25','2017-09-26',1);
INSERT INTO [dbo].[tb_bloco]([id],[inicio],[fim],[atividade_id])VALUES(2,'2017-09-27','2017-09-28',2);
INSERT INTO [dbo].[tb_bloco]([id],[inicio],[fim],[atividade_id])VALUES(3,'2017-09-20','2017-09-21',2);

INSERT INTO [dbo].[tb_participante]([id],[nome],[email])VALUES(1,'José','jose@gmail.com');
INSERT INTO [dbo].[tb_participante]([id],[nome],[email])VALUES(2,'Maria','maria@gmail.com');

INSERT INTO [dbo].[tb_participacao]([participante_id],[atividade_id])VALUES(1,1);
INSERT INTO [dbo].[tb_participacao]([participante_id],[atividade_id])VALUES(1,2);
INSERT INTO [dbo].[tb_participacao]([participante_id],[atividade_id])VALUES(2,1);
INSERT INTO [dbo].[tb_participacao]([participante_id],[atividade_id])VALUES(2,2);