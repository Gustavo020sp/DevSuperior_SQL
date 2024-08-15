--Create tables DDL
CREATE TABLE tb_regiao(
	id INT PRIMARY KEY,
	nome VARCHAR(30) NOT NULL,
	localidade_s FLOAT,
	localidade_w FLOAT,
	descricao VARCHAR(30)
);

CREATE TABLE tb_vinicola(
	id INT PRIMARY KEY,
	nome VARCHAR(20) NOT NULL,
	descricao VARCHAR(100),
	fone VARCHAR(9),
	email VARCHAR(30),
	regiao_id INT NOT NULL,
	FOREIGN KEY (regiao_id) references tb_regiao(id)
);

CREATE TABLE tb_tipo_vinho(
	id INT PRIMARY KEY,
	nome VARCHAR(20) NOT NULL
);

CREATE TABLE tb_vinho(
	id INT PRIMARY KEY,
	nome VARCHAR(20) NOT NULL,
	tipo_id INT NOT NULL,
	preco FLOAT,
	vinicola_id INT NOT NULL,
	FOREIGN KEY (tipo_id) references tb_tipo_vinho(id),
	FOREIGN KEY (vinicola_id) references tb_vinicola(id)
);

--Seed Database DML
INSERT INTO dbo.tb_regiao([id],[nome],[localidade_s],[localidade_w],[descricao])VALUES(1,'Vale Central',33.8088,70.7644,'Chile');
INSERT INTO dbo.tb_regiao([id],[nome],[localidade_s],[localidade_w],[descricao])VALUES(2,'Serra Gaúcha',29.3746,50.8764,'Sul do Brasil');

INSERT INTO dbo.tb_vinicola([id],[nome],[descricao],[fone],[email],[regiao_id])
VALUES(1,'Santa Rita','localizada no valle del maipo e tem mais de 100 anos de história',null,'santa@gmail.com',1);
INSERT INTO dbo.tb_vinicola([id],[nome],[descricao],[fone],[email],[regiao_id])
VALUES(2,'Santa Carolina',null,'3395-4422','carolina@gmail.com',1);
INSERT INTO dbo.tb_vinicola([id],[nome],[descricao],[fone],[email],[regiao_id])
VALUES(3,'Garibaldi','Vinicula situada na serra gaúcha','9822-3344','garibaldi@gmail.com',2);

INSERT INTO dbo.tb_tipo_vinho([id],[nome])VALUES(1,'Tinto');
INSERT INTO dbo.tb_tipo_vinho([id],[nome])VALUES(2,'Branco');
INSERT INTO dbo.tb_tipo_vinho([id],[nome])VALUES(3,'Rose');
INSERT INTO dbo.tb_tipo_vinho([id],[nome])VALUES(4,'Bordeaux');

INSERT INTO dbo.tb_vinho([id],[nome],[tipo_id],[preco],[vinicola_id])VALUES(1,'Amanda',1,100.0,1);
INSERT INTO dbo.tb_vinho([id],[nome],[tipo_id],[preco],[vinicola_id])VALUES(2,'Belinha',2,200.0,1);
INSERT INTO dbo.tb_vinho([id],[nome],[tipo_id],[preco],[vinicola_id])VALUES(3,'Camila ',4,65.0,2);
INSERT INTO dbo.tb_vinho([id],[nome],[tipo_id],[preco],[vinicola_id])VALUES(4,'Daniela ',3,89.0,2);
INSERT INTO dbo.tb_vinho([id],[nome],[tipo_id],[preco],[vinicola_id])VALUES(5,'Eduarda ',1,55.0,3);
INSERT INTO dbo.tb_vinho([id],[nome],[tipo_id],[preco],[vinicola_id])VALUES(6,'Fernanda ',2,70.0,3);


--Projeção
SELECT id, nome
FROM tb_vinicola

--Restrição
SELECT * 
FROM tb_vinicola
WHERE regiao_id = 1


--Projeção e restrição
SELECT id, nome, regiao_id
FROM tb_vinicola
WHERE regiao_id = 1 

--Produto Cartesiano
SELECT *
FROM tb_regiao, tb_vinicola

--Junção
SELECT *
FROM tb_vinho
INNER JOIN tb_regiao ON tb_vinho.vinicola_id = tb_regiao.id